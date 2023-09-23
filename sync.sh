#!/bin/bash
repo init --depth=1 --no-repo-verify -u https://github.com/Evolution-X/manifest -b tiramisu-jem -g default,-mips,-darwin,-notdefault
git clone https://github.com/mitsu00/local_manifest.git --depth 1 -b evox-13 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

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
wget -q https://api.ozip.my.id/NGCam_7.4.104-v2.0_eng.apk -O device/xiaomi/mt6768-common/GCamPrebuilt/GCamPrebuilt.apk

# stagefright: remove HW_TEXTRUE usage from SurfaceMediaSource
# git -C "frameworks/av" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_av/commit/a727c1f68fd30c8e6a4068db9dc26670d4a78f6c.patch")"

# REThreaded: Use gen- and delete- textures on all render engines
# git -C "frameworks/native" am <<<"$(curl -sL "https://github.com/ArrowOS/android_frameworks_native/commit/1e483eea5cf3b4972939a313652aebac42a1561c.patch")"

# Media: mediatek: codecs & extractor PATCH
wget -q https://api.ozip.my.id/media_codecs.patch
wget -q https://api.ozip.my.id/media_extractor.patch
cd frameworks/av
git am ../../media_codecs.patch
git am ../../media_extractor.patch

# Evox: Change default wallpaper (W.I.P)
cd ../../vendor/evolution/rro_overlays/EvolutionXConfigOverlay/res/drawable-nodpi
rm default_wallpaper.png
wget -q https://api.ozip.my.id/default_wallpaper.png
