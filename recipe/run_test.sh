#!/usr/bin/env bash
cd test

for f in *.py; do
    if [ python "$f" -ne 0 ]; then
        echo "Trying to Fail!"
        exit 1
    else
        echo "Test reported ok"
    fi
done
exit 0
