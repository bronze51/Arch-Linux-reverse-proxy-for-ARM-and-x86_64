#!/bin/bash

cache_root=<your folder goes here>
for cache_dir in $cache_root/archlinux/*/os/x86_64/ $cache_root/armv7h/*; do
# Only leaves the last version of the package. Works for me, so far.
  paccache -r -k1 -c $cache_dir
done
# Probably need to also delete packages that have been in cache for a looong time
