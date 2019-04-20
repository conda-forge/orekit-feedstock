#!/usr/bin/env bash
cd test

ERROR=0

for f in *.py; do
    if python "$f"; then
        echo "Test reported ok"
    else
        echo "Test failed"
        ERROR=1
    fi
done
exit $ERROR
