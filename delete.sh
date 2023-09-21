#!/bin/bash
voltage=*.runner.zip
if test -f "$voltage"; then
    echo "$voltage exists."
    rm -rf $voltage
fi
