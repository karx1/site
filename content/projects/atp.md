+++
title = "atp: a tcp proxy"
date = "2022-06-24"
+++

`atp` is a simple TCP proxy written in rust.

### Why?

In the past, I had nginx set up to serve my websites, and it also served as a TCP proxy for SSH. Recently, however, I switched to Caddy for HTTPS. Caddy, unfortunately, doesn't have a TCP proxy, so I had to keep nginx around for my proxying needs. I find this a bit overkill though, which is where `atp` comes in. 

### Configuration

The configuration is in the TOML format. A sample config follows:

```toml
"192.168.1.28:6667" = 8000
"192.168.1.48:1604" = 1604
```

### Running

```sh
cargo run /path/to/config.toml
```

If no path is provided, `atp` will fall back to looking for `config.toml` in the current directory.

Links:
- [Source code](https://git.karx.xyz/karx/atp)
