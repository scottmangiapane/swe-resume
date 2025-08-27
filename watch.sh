#!/bin/sh

trap "echo 'Exiting...'; exit 0" INT TERM

echo "Polling .tex files by hash..."
last_hash=""

while true; do
    current_hash=$(find . -name '*.tex' -type f -exec sha256sum {} \; 2>/dev/null | sort | sha256sum | awk '{print $1}')
    if [ "$current_hash" != "$last_hash" ]; then
        echo "Change detected, rebuilding PDF..."
        pdflatex -interaction=nonstopmode -halt-on-error -file-line-error resume.tex
        last_hash=$current_hash
    fi
    sleep 1
done
