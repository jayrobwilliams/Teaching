#!/bin/bash
find . -type f -iname "*.docx" -print0 | while IFS= read -r -d $'\0' line; do
    pandoc -t latex "$line" -o "${line/docx/pdf}" -V geometry:margin=1in
    ps2ascii "${line/docx/pdf}" | wc -w  > "$(echo "$line" | sed -e 's%/[^/]*$%/%')wc.txt"
done