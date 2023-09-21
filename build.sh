#!/bin/bash
. build/envsetup.sh
lunch evolution_merlinx-user
make evolution -j48
