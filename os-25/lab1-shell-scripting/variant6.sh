#!/bin/bash
d=$1
{ echo ""; find "$d" -mindepth 1 -type d -printf '%P\n'; } |
while read -r r; do
  n=${r:-$(basename "$d")}
  p="$d/$r"
  c=$(find "$p" -type f | wc -l)
  s=$(find "$p" -type f -printf '%s\n' | awk '{t+=$1} END{print t+0}')
  echo -e "$n\t$c\t$s"
done | sort -t $'\t' -k2,2nr -k3,3nr -k1,1 | awk -F'\t' '{print $1" "$2" "$3}'