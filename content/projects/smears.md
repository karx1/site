+++
title = "SmeaRS: an image smearing algorithm"
date = "2021-09-11"
+++

`SmeaRS` is an image "smearing" algorithm written in Rust.

First, it takes an input image file and writes random chunks of it to new files. After that, it stitches the new image files into a video.

`SmeaRS` uses the [MozJPEG](https://github.com/mozilla/mozjpeg) compression algorithm so that the generated image files are written quickly and take up less space on the disk.

Links:
- [Source Code](https://git.karx.xyz/karx/smears)
