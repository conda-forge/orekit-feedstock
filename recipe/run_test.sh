#!/usr/bin/env bash
cd test

for f in *.py; do
    if [ python "$f" ]; then
        echo "Trying to Fail!"
        exit 1
    fi

done

