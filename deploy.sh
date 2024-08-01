#! /bin/bash
git pull
zola build
minify --recursive public/
