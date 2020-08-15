#!/bin/bash

REVISION=$1

if [ -d $REVISION ] ; then
  echo "already have this version"
  exit
fi

ZIP_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F$REVISION%2Fchrome-linux.zip?alt=media"

ZIP_FILE="${REVISION}-chrome-linux.zip"

echo "fetching $ZIP_URL"

mkdir $REVISION
pushd $REVISION

# -#: change progress meter
curl -# $ZIP_URL > $ZIP_FILE

echo "unzipping.."
unzip $ZIP_FILE

popd
