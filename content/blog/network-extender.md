+++
title = "How to use your Raspberry Pi as a WiFi extender!"
date = "2022-08-04"
+++

The place where I program has the worst connection to my router throughout the whole house. Obviously, this isn't ideal for most programming workloads such as looking up documentation and especially for cloning the [crates.io index](https://github.com/rust-lang/crates.io-index).

Luckily, I had Ethernet wired through the whole house, and I also had a Raspberry Pi and about 30 minutes.

### Required materials
For my setup, I used a [Raspberry Pi 0 W](https://www.raspberrypi.com/products/raspberry-pi-zero-w/) because it's dirt cheap and has WiFi built-in. 

You'll also need a [Ethernet-to-MicroUSB adapter](https://www.amazon.com/Smays-Micro-B-Ethernet-compatible-Raspberry/dp/B01AT4C3KQ/ref=sr_1_3?keywords=ethernet+to+micro+usb+adapter&qid=1659634388&sr=8-3) if you're on one of the  Raspberry Pi 0 models (such as 02, 0W, and 0WH), like I am. If you're on a Pi 1-4, you can just use the onboard Ethernet port.

Just in case, you might also want to keep around a USB keyboard and an HDMI monitor around in case anything goes wrong and you can't access the Pi using SSH.

### Switch to systemd-networkd

{% alert(type="warning") %}
This setup <em>will</em> break any DNS servers already running on your Pi, such as Pi-Hole, so make sure you know what you're getting into.
{% end %}

You need to be root for the whole guide, so either use `sudo -Es` or `sudo su` to switch to the root user.

First, you have to remove the "classic" networking. You can do this while connected to SSH, so don't worry.

```bash
systemctl daemon-reload
systemctl disable --now ifupdown dhcpcd dhcpcd5 isc-dhcp-client isc-dhcp-common rsyslog
apt --autoremove purge ifupdown dhcpcd dhcpcd5 isc-dhcp-client isc-dhcp-common rsyslog
rm -r /etc/network /etc/dhcp
systemctl disable --now avahi-daemon libnss-mdns
apt --autoremove purge avahi-daemon
```

Next, install and set up systemd-resolved and systemd-networkd.

```bash
apt install libnss-resolve
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
apt-mark hold avahi-daemon dhcpcd dhcpcd5 ifupdown isc-dhcp-client isc-dhcp-common libnss-mdns openresolv raspberrypi-net-mods rsyslog
systemctl enable systemd-networkd.service systemd-resolved.service
```

### Set up wpa_supplicant as an access point.

wpa_supplicant is what Raspbian uses for its WiFi configuration. We need to configure it to broadcast an access point that our devices can later connect to.

First, create `/etc/wpa_supplicant/wpa_supplicant-wlan0.conf` and add the following contents:

```conf
# /etc/wpa_supplicant/wpa_supplicant-wlan0.conf

country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="..." # Set to your desired network name
    mode=2
    frequency=2437 # change this to 5000 if you want a 5GHz access point
    #key_mgmt=NONE # uncomment this if you don't want a password
    # delete next 3 lines if key_mgmt=NONE
    key_mgmt=WPA-PSK
    proto=RSN WPA
    psk="..." # set this to your desired password
}
```

{% alert(type="warning") %}
Your password will be stored in <em>plain text</em> so make sure this file is not readable by anyone you don't want seeing the password
{% end %}

### Setting up the bridge

Now, we need to create a *bridge* network interface. This interface will bridge packets coming from the WiFi interface (`wlan0`) and send them over the Ethernet interface (`eth0`). This will allow devices connected to the Pi to appear on the same subnet as devices connected to the router itself.

First, define the interface:

```ini
; /etc/systemd/network/02-br0.netdev

[NetDev]
Name=br0
Kind=bridge
```

Then, tell `systemd-networkd` to bridge packets to `eth0`:

```ini
; /etc/systemd/network/04-br0_add-eth0.network

[Match]
Name=eth0
[Network]
Bridge=br0
```

Finally, configure network settings on the bridge:

```ini
; /etc/systemd/network/12-br0_up.network

[Match]
Name=br0
[Network]
MulticastDNS=yes
DHCP=yes
```

### Tell wpa_supplicant to use a bridge

Now we have our bridge configured, but we need to tell our WiFi interface to actually use it. To do this, edit the `.service` file:

```bash
systemctl edit wpa_supplicant@wlan0.service
```

This will open up your editor. In this editor add these lines:

```ini
[Service]
ExecStartPre=/sbin/iw dev %i set type __ap
ExecStartPre=/bin/ip link set %i master br0

ExecStart=
ExecStart=/sbin/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-%I.conf -Dnl80211,wext -i%I -bbr0

ExecStopPost=-/bin/ip link set %i nomaster
ExecStopPost=-/sbin/iw dev %i set type managed
```

### Epilogue

Finally, reboot. That's it! Your shiny new network extender should appear in the list of local WiFi networks. Connect to it, and see the difference!

If you have any questions, feel free to [shoot me an email](mailto:yash@karx.xyz)!


