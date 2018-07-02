#!/usr/bin/env bash

mdbook build
git checkout gh-pages
(cd book && tar -c .) | tar -xf -
rm -rf book
git add .
git commit -m 'Update docs'
