#!/bin/bash
repo init --depth=1 --no-repo-verify -u https://github.com/Miku-UI/manifesto -b TDA -g default,-mips,-darwin,-notdefault
git clone https://github.com/mitsu00/local_manifest.git --depth 1 -b miku-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j4
