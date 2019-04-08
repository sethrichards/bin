#!/bin/bash
# I can never remember the arguments to pandoc, so here's a script to do it.

INPUT_NAME="$1"
SHORT_NAME=$(basename -s .md "$INPUT_NAME")
OUTPUT_NAME="${SHORT_NAME}".docx

#### FIXME - check for existence of pandoc

echo "Converting ${INPUT_NAME} (markdown) to ${OUTPUT_NAME} (docx)..."

pandoc -r markdown_github -w docx --number-sections -o "${OUTPUT_NAME}" "${INPUT_NAME}"

echo "...Conversion complete."
