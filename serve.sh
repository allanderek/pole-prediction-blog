#!/bin/sh

./build.sh
echo "Should be able to visit site at https://clouddev.pakk.io:4014"
npx serve -l 4004 _site

