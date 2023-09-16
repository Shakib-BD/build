#!/bin/bash
repo init --depth=1 --no-repo-verify -u repo init -u https://github.com/exTHmUI/android -b Tenshi -g default,-mips,-darwin,-notdefault
git clone https://github.com/mitsu00/local_manifest.git --depth 1 -b exthm-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j4

# check
echo ""
echo "Check home dir:"
ls ../
echo "Check work dir:"
ls
echo "Check complete"

# KernelSU Patch
wget https://raw.githubusercontent.com/mitsuav/workflow-test/main/KernelSU.patch
cd kernel/xiaomi/mt6768
git apply ../../../KernelSU.patch
