+++
title = "How to manually update Discord on Arch Linux"
description = "must be your lucky day, there's a new update!"
date = "2022-10-26"
+++

Discord updates can be annoying, especially if you're not on Windows or a Debian-based Linux distribution. This is because Discord ships their own `.deb` files and is not distributed through a repository.

Arch Linux, on the other hand, distributes Discord through its `community` repository. When an update rolls around, though, usually it takes a while for the package maintainer to push an update. For platforms like this, Discord shows a "helpful" message, leaving users to figure it out on their own.

{% img(src="/imgs/2022-10-26_08-37.png") %}
Message shown when Discord needs to be updated
{% end %} 

Fortunately though, there's a solution.

### The cheaty way

This method allows you to trick the Discord executable into thinking it's been updated. First, check for the path of the `discord` executable:

```sh
file $(which discord)
# Output - /sbin/discord: symbolic link to /opt/discord/Discord
```

Then, `cd` to the directory it gave you. In my case it's `/opt/discord`.

Now, edit `resources/build_info.json` with your favorite text editor. It should look like this:

```json
{
    "releaseChannel": "stable",
    "version": "0.0.xx"
}
```

Update the `version` field to the current version of Discord (0.0.21 as of October 26th, 2022).

### The `PKGBUILD` way

{% alert(type="info") %}
Make sure you know how to build and install [AUR](https://aur.archlinux.org/) packages before using this method.
{% end %}

If you don't like editing configuration files to update things, you can also download the package's `PKGBUILD` and build the package yourself. This involves using the [Arch Build System](https://wiki.archlinux.org/title/Arch_Build_System). This method is also useful if you want to build the package on one machine and transfer it to another machine.


To get started, install the `asp` package through pacman. This will let you download a PKGBUILD from the Arch repository.

Now, export the current `PKGBUILD` for the `discord` package:

```sh
asp export discord
# Output - ==> exporting discord:trunk
```

This will create a `discord` directory inside your working directory. Enter this directory and you will see a PKGBUILD. It should look like this (some contents omitted):

```sh
pkgname=discord
_pkgname=Discord
pkgver=0.0.xx
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."

# ...

prepare() {
    # ...
}

package() {
    # ...
}
```

Update the `pkgver` field to the current version of Discord (0.0.21 as of October 26th, 2022). Then, build the package as you would an AUR package:

```sh
makepkg -si
```

Now the updated package should be installed.

### Epilogue

Open the launcher. Discord should now install updates and launch as normal. Enjoy!

Once the updated version is finally pushed to the repository, you should be able to update with `pacman -Syu` as normal, and your system should switch to the version from the repository (unless you used the `PKGBUILD` method, in which case pacman will treat your custom built version and the version in the repository as the same).

#### Futher reading:

 - [Arch Build System - ArchWiki](https://wiki.archlinux.org/title/Arch_Build_System#Retrieve_PKGBUILD_source)
 - [Discord - ArchWiki](https://wiki.archlinux.org/title/Discord#Discord_asks_for_an_update_not_yet_available_in_the_repository)

As always, if you have any questions, feel free to [shoot me an email](mailto:yash@karx.xyz)!
