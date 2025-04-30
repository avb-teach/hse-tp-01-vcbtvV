#!/bin/bash

for file in $(find "$1" -type f); do
    filename=$(basename "$file")
    if [ -f "$2/$filename" ]; then
        i=1
        name=${filename%.*}
        ext=${filename##*.}
        while [ -f "$2/$filename" ]; do
            filename="$name_$i.$ext"
            ((i++))
        done
    fi
    cp "$file" "$2/$filename"
done



