+++
title = "crabtagger"
description = "Music metadata editor using GTK3 and Rust"
date = "2024-07-29"
+++

`crabtagger` is a GUI music metadata editor written in rust using GTK3 as its GUI backend.

Currently it is able to set the title, album, artist, cover image, and date of audio files in various tagging formats using the [`multitag`](/projects/multitag) crate.
More functionality and the ability to edit more tags will be added in the future.

To run crabtagger, first clone the source code:
```sh
git clone https://github.com/karx1/crabtagger
```

Then, change into the cloned directory and run the project with `cargo`:
```sh
cd crabtagger
cargo run --release
```

Links:
- [Source Code](https://github.com/karx1/crabtagger)
