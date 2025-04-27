#!/bin/bash

inputdir="$1"
outputdir="$2"

if [ "$#" -ne 2 ]; then
	echo "Ошибка: не 2 директории"
	exit 1 
fi

find "$1" -type f -print0 | while IFS= read -r -d '' file; do
    filename=$(basename "$file")
    dest_file="$2/$filename"
    counter=1
    while [ -f "$dest_file" ]; do
        base="${filename%.*}"
        ext="${filename##*.}"
        dest_file="$2/${base}_${counter}.${ext}"
        ((counter++))
    done
    cp "$file" "$dest_file"
done


