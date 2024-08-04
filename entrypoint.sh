#!/bin/sh -l

LINT_LOG=lint.log

if [ -z $INPUT_TOOL ]; then
    echo "You must specify either 'write-good' or 'proselint' as the first argument."
    exit 1
fi

# Find all markdown files and run the selected tool on them
FILES=$(find . -name "*.md" -not -path $INPUT_IGNORE_PATHS)
$INPUT_TOOL $FILES >> $LINT_LOG
cat $LINT_LOG
cat ./README.md
