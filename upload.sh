#!/bin/bash
echo ""
echo "======================"
for file in *.zip; do
    echo "$file exist"
    curl -T $file temp.sh
done
echo ""
echo "======================"
recovery=recovery.img
if test -f "$recovery"; then
    echo "$recovery exists."
    curl -T $recovery temp.sh
fi
echo ""
