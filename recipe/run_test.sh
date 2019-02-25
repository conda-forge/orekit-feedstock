#!/usr/bin/env bash
cd test
set -e
for f in *.py; do python "$f"; done || exit 1

