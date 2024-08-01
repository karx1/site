#! /bin/bash
git pull
zola build
minify -r -a -o public/ public
