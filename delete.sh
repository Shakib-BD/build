#!/bin/bash
voltage=*.runner.zip
for file in $voltage; do
    echo "$file exist"
    rm -rf $file
done


