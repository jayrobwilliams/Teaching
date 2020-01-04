#!/bin/bash
find . -type f -iname "*.pdf" -print0 | while IFS= read -r -d $'\0' LINE
do
    ps2ascii "$LINE" | wc -w  > "${LINE/%.pdf/-wc.txt}"
done
