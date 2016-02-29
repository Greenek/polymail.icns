#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

ICONSET="Polymail.iconset"

ICONSMALL="Icon64.png"
ICONLARGE="Icon1024.png"

rm -rf $ICONSET && mkdir $ICONSET

sips -z 16 16     $ICONSMALL --out $ICONSET/icon_16x16.png
sips -z 32 32     $ICONSMALL --out $ICONSET/icon_16x16@2x.png
sips -z 32 32     $ICONSMALL --out $ICONSET/icon_32x32.png
sips -z 64 64     $ICONSMALL --out $ICONSET/icon_32x32@2x.png
sips -z 128 128   $ICONLARGE --out $ICONSET/icon_128x128.png
sips -z 256 256   $ICONLARGE --out $ICONSET/icon_128x128@2x.png
sips -z 256 256   $ICONLARGE --out $ICONSET/icon_256x256.png
sips -z 512 512   $ICONLARGE --out $ICONSET/icon_256x256@2x.png
sips -z 512 512   $ICONLARGE --out $ICONSET/icon_512x512.png
cp $ICONLARGE $ICONSET/icon_512x512@2x.png

iconutil -c icns $ICONSET

rm -R $ICONSET
