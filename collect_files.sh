#!/bin/bash

inputdir="$1"
outputdir="$2"

if [ "$#" -ne 2 ]; then
	echo "Ошибка: не 2 директории"
	exit 1 
fi

for file in $(find "$1" -type f); do
    filename=$(basename "$file")
    dest_file="$2/$filename"
    if [ -f "$dest_file" ]; then
        i=1
        while [ -f "$dest_file" ]; do
            dest_file="$2/${filename%.*}_$i.${filename##*.}"
            ((i++))
        done
    fi
    cp "$file" "$dest_file"
done
