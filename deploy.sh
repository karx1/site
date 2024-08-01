#! /bin/bash
git pull
zola build
minify public/
