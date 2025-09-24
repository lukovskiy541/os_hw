#!/bin/bash
d=$1


files=$(find "$d" -type f | wc -l)
size=$(du -sb "$d" | cut -f1)
echo "$(basename "$d") $files $size"

find "$d" -mindepth 1 -type d -printf '%P\n' | while read subdir; do
    full_path="$d/$subdir"
    files=$(find "$full_path" -type f | wc -l) 
    size=$(du -sb "$full_path" | cut -f1)
    echo "$subdir $files $size"
done | sort -k2,2nr -k3,3nr