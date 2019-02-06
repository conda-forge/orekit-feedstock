#!/usr/bin/env bash
cd test
for f in *.py; do python "$f"; done || exit 1

