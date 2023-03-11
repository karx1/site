+++
title = "dircord"
description = "A Discord-IRC bridge written in Rust"
date = "2022-06-24"
+++

`dircord` is a very simple Discord-to-IRC bridge written in Rust.

Features include webhook support, discord and irc formatting, discord replies, and more.

### Building

```bash
cargo build --release
```

### Running

```bash
target/release/dircord /path/to/config.toml
```

If a path to a config file is not provided, dircord will look for a `config.toml` in the working directory.

Links:
- [Source code](https://git.karx.xyz/karx/dircord)
