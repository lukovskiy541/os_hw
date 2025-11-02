#!/bin/sh

for f in *.c; do
  [ "$f" = gplv1.c ] || [ "$f" = gplv2.c ] && continue
  awk 'ARGIND==1{v1=v1$0 ORS;next} ARGIND==2{v2=v2$0 ORS;next} {s=s$0 ORS} END{p=index(s,v1); if(p) printf "%s%s%s", substr(s,1,p-1), v2, substr(s,p+length(v1)); else printf "%s", s}' \
      gplv1.c gplv2.c "$f" > "$f.tmp" && mv "$f.tmp" "$f"
done
