#!/bin/bash

DATE=$(date +%Y-%m-%d)
echo $DATE-$1

cat _post_example.md|sed "s/DATE/$DATE/g" > _posts/$DATE-$1.markdown
