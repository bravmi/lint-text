#!/bin/sh -l

if [ -z $INPUT_TOOL ]; then
    echo "You must specify either 'write-good' or 'proselint' as the first argument."
    exit 1
fi

# Find all markdown files and run the selected tool on them
files=$(find . -name "*.md" -not -path $INPUT_IGNORE_PATHS)
$INPUT_TOOL $files
