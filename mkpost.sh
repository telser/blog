#!/bin/sh

TITLE=$1
DATE=`date -j +'%Y-%m-%d'`
FILENAME=$DATE-$1.org

touch posts/$FILENAME

echo "---" >> posts/$FILENAME
echo "title: $TITLE" >> posts/$FILENAME
echo "subtitle:" >> posts/$FILENAME
echo "tags:" >> posts/$FILENAME
echo "---" >> posts/$FILENAME
