#!/bin/sh -l

# Check for write-good or proselint argument
if [ "$1" = "write-good" ]; then
    TOOL="write-good"
elif [ "$1" = "proselint" ]; then
    TOOL="proselint"
else
    echo "You must specify either 'write-good' or 'proselint' as the first argument."
    exit 1
fi

# Find all markdown files and run the selected tool on them
FILES=$(find . -name "*.md")
for FILE in $FILES; do
    echo "Running $TOOL on $FILE"
    if [ "$TOOL" = "write-good" ]; then
        write-good "$FILE"
    else
        proselint "$FILE"
    fi
done
