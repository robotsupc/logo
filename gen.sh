#!/bin/bash

rm -r jpg
cp -r png jpg
cd jpg
mogrify -background white -alpha remove -format jpg *.png
rm *.png
