#!/bin/bash
repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-X/manifest -b tiramisu -g default,-mips,-darwin,-notdefault
git clone https://github.com/mitsu00/local_manifest.git --depth 1 -b evox-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j4

# check
echo ""
echo "Check home dir:"
ls ../
echo "Check work dir:"
ls
echo "Check complete"

# kernel: KernelSU Patch
wget https://raw.githubusercontent.com/mitsuav/workflow-test/main/KernelSU.patch
cd kernel/xiaomi/mt6768
git apply ../../../KernelSU.patch
curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash -s main

# mt6768-common: Nikita GCam PATCH
cd ../../../
rm device/xiaomi/mt6768-common/GCamPrebuilt/GCamPrebuilt.apk
wget https://api.ozip.my.id/NGCam_8.2.300-v1.8.apk -O device/xiaomi/mt6768-common/GCamPrebuilt/GCamPrebuilt.apk

# Media: mediatek: codecs & extractor PATCH
wget https://api.ozip.my.id/media_codecs.patch
wget https://api.ozip.my.id/media_extractor.patch
cd frameworks/av
git apply ../../media_codecs.patch
git apply ../../media_extractor.patch

# Evox: Change default wallpaper (W.I.P)
cd ../../vendor/evolution/rro_overlays/EvolutionXConfigOverlay/res/drawable-nodpi
rm default_wallpaper.png
wget https://api.ozip.my.id/default_wallpaper.png
