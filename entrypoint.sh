#!/bin/sh -l

LINT_LOG=lint.log

if [ -z $INPUT_TOOL ]; then
    echo "You must specify either 'write-good' or 'proselint' as the first argument."
    exit 1
fi

# Find all markdown files and run the selected tool on them
FILES=$(find . -name "*.md" -not -path $INPUT_IGNORE_PATHS)
echo $FILES
for FILE in $FILES; do
    echo "Running $TOOL on $FILE"
    proselint "$FILE"
    if [ "$TOOL" = "write-good" ]; then
        write-good "$FILE" >> $LINT_LOG
    else
        proselint "$FILE" >> $LINT_LOG
    fi
done

cat $LINT_LOG
