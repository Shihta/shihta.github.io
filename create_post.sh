#!/bin/bash

DATE=$(date +%Y-%m-%d)
echo $DATE-$1

cat _example_post.md|sed "s/DATE/$DATE/g" > _posts/$DATE-$1.adoc
mkdir -p static/$DATE
