+++
title = "multitag"
description = "Audio tagging crate for Rust"
date = "2024-08-11"
+++

`multitag` is an audio tagging crate for Rust, which supports various audio tagging backends such as id3, flac, and m4a tagging. We are working on adding support for more tag formats in the future.

This library was created for [`crabtagger`](/projects/crabtagger) and intends to replace the existing `audiotags` crate, which I personally saw some issues with (specifically, lack of `.wav` support and some non-idiomatic Rust practices).

To add multitag to your project, simply run:
```sh
cargo add multitag
```

Or, add the following line to your `Cargo.toml`, with the desired version:
```toml
[dependencies]
multitag = "<version>"
```


Feel free to leave an issue or pull request if a feature that you need is missing from the crate!

Links:
- [Source Code](https://github.com/karx1/multitag)
- [crates.io](https://crates.io/crates/multitag)

