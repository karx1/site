+++
title = "Adventures in writing a game engine in Rust: Part 1"
date = "2022-03-25"
+++

For the last couple of weeks, I've been working on developing [cat-box](https://crates.io/crates/cat-box/).

I wrote this crate because frankly I was disappointed with [bevy](https://crates.io/crates/bevy) and I wanted something more similar to [python's `arcade` library](https://arcade.academy/) in the Rust ecosystem.

The first thing I did was looking into various rendering backends. In the end, I settled on `SDL`, particularly the [sdl2](https://crates.io/crates/sdl2) crate for Rust, because I felt it was simple and lightweight.

First, I created a `Game` struct which stored basic window information such as dimensions and window title. I then added a `run` method which took [Rust's version of a function pointer](https://doc.rust-lang.org/std/ops/trait.Fn.html). To this function I passed a reference to SDL's `Canvas` and `EventPump` structs. After that, I just called this function and updated the canvas inside a loop.

At this point, I didn't have any way to terminate the render loop. To this end, I made a `terminate` method. Only one problem: I had to rely on [interior mutability](https://doc.rust-lang.org/reference/interior-mutability.html) because Rust only lets you have one mutable reference to a thing at a time, so I couldn't let `terminate` take a mutable reference to the `Game` struct.

After this, I made a simple program which opened a window and waited for a certain key to be pressed before closing the window.

The code for this is on [my gitea](https://git.karx.xyz/karx/catbox) and published on [crates.io](https://crates.io/crates/cat-box). If you spot an issue, feel free to shoot me an email with a description or even a patch! 
