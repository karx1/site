+++
title = "Linux 5.16 Released - here's what's new!"
date = "2022-01-14"
+++

Linux 5.16 is here! It brings many improvements for those who are interested in Linux gaming (me included) and as usual, performance and compatibility improvements.

Arch Linux users can expect to enjoy the new kernel soon, once it lands in the `core` repository.

### No more `waitv`ing for FUTEX

This kernel release adds FUTEX2's `futex_waitv` syscall into the "vanilla" kernel, removing the need for custom patches or modifications. This syscall improves performance for Windows games running on Linux through Wine or Proton, and it could potentially benefit native games in the future as well.

### 1 M1 for Me

This kernel adds support for USB, PCIe, and the Apple Magic Keyboard on machines running Apple's new M1 ARM CPU architecture.

### All the controllers

Users can now connect the PlayStation 5's DualSense controllers, thanks to a contribution from Sony. The Nintendo Switch's Joy-Cons are also newly supported.

### A piece of computing Pi

The new kernel can now run on the brand-new Raspberry Pi 4 Compute Module, without any extra build steps or patches (aside from potentially cross-compiling to the ARM architecture)

### Supporting a new generation

The 13th generation of Intel processors and AMD's Ryzen 6000 mobile processors will be released soon. The new kernel release contains the groundwork to support both processors as soon as they're released.

### Epilogue

These are some of the major improvements in the new Linux Kernel. If you have any questions, feel free to shoot me an email!
