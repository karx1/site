+++
title = "opusmeta"
description = "ogg opus metadata crate for Rust"
date = "2024-08-18"
+++

`opusmeta` is a Rust crate for reading and writing metadata from ogg opus files, created for [`multitag`](/projects/multitag)

The crate supports setting arbitrary field names and values in the vorbis comment format, and also supports encoding and decoding pictures in accordance with the [METADATA_BLOCK_PICTURE](https://wiki.xiph.org/VorbisComment#Cover_art) proposal.

To add opusmeta to your project, simply run:
```sh
cargo add opusmeta
```

Or, add the following line to your `Cargo.toml`, with the desired version:
```toml
[dependencies]
opusmeta = "<version>"
```

Feel free to leave an issue or pull request if a feature that you need is missing from the crate!

Links:
- [Source Code](https://github.com/karx1/opusmeta)
- [crates.io](https://crates.io/crates/opusmeta)
