#!/bin/bash
# create multiresolution windows icon
ICON_DST=../../src/qt/res/icons/nanite.ico

convert ../../src/qt/res/icons/nanite-16.png ../../src/qt/res/icons/nanite-32.png ../../src/qt/res/icons/nanite-48.png ${ICON_DST}
