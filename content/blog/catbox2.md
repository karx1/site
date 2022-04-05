+++
title = "Adventures in writing a game engine in Rust: Part 2"
date = "2022-04-05"
+++

The next thing I had to do was to add support for rendering images. The first thing I did was to just create a `Sprite` struct, which stored the image and the destination rectangle. This rectangle was used to set the properties of the drawn image on the screen.

Initially, I used an SDL technique called ["surface blitting"](https://wiki.libsdl.org/SDL_BlitSurface). It worked well at first, however, when moving the destination rectangle around, old copies of the sprite were not being cleared off the screen, even when using the SDL canvas's `clear` method. The sprite would also flicker with each frame, because it was being redrawn twice on each frame.

Then, I discovered a method in SDL called [RenderCopyEx](https://wiki.libsdl.org/SDL_RenderCopyEx). Aside from fixing all the issues mentioned above, it also included options to angle and flip the texture before drawing it to the screen. Now, users could draw `Sprite`s to the screen at an angle, without any ugly trails or flickering.

This marked the [first published version](https://crates.io/crates/cat-box/0.1.0) of cat-box on crates.io, and you can see how far it's come since then.

As always, the codeis on [my gitea](https://git.karx.xyz/karx/catbox) and published on [crates.io](https://crates.io/crates/cat-box). If you spot an issue, feel free to shoot me an email with a description of the issue or even a patch which fixes it!
