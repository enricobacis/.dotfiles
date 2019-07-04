#!/bin/bash

filename=$1

if test -z $filename || ! test -e $filename; then
    echo "Usage: clean-pdf.sh filename.pdf or clean-pdf.sh dirname"
    exit 1
fi

if ! command -v convert >/dev/null; then
    echo "Error: convert (imagemagick) not found"
    exit 1

elif ! command -v exiftool >/dev/null; then
    echo "Error: exiftool not found"
    exit 1

elif ! command -v qpdf >/dev/null; then
    echo "Error: qpdf not found"
    exit 1
fi

if test -d $filename; then
    for f in $filename/*.pdf; do
        echo "[*] Cleaning $f ..."
        bash ./$0 $f
    done

elif test -f $filename; then
    cleandir="$(dirname $filename)/clean"
    cleanname="$cleandir/$(basename $filename)"
    mkdir -p $cleandir && \
    convert -density 200 "$filename" "$cleanname" && \
    exiftool -ignoreMinorErrors -all:all= "$cleanname" && \
    exiftool -delete_original! "$cleanname" && \
    qpdf --linearize "$cleanname" "$cleanname.2" && \
    mv "$cleanname.2" "$cleanname"

    if test $? -eq 0; then
        echo -e "\n[*] $cleanname created"
        exit 0
    else
        echo -e "\n[*] Error creating file $cleanname"
        exit 1
    fi

else
    echo "Error: Unrecognized file $filename"
    exit 1
fi
