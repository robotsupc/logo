#!/bin/bash

rm -rf jpg
cp -r png jpg
pushd jpg
mogrify -background white -alpha remove -format jpg *.png
rm *.png
popd

QUALITIES="60 80 100"
for qual in $QUALITIES; do
	rm -rf webp-$qual
	cp -r png webp-$qual
	pushd webp-$qual
	for i in $(ls); do
		filename=$(basename "$i")
		extension="${filename##*.}"
		filename="${filename%.*}"
		cwebp -q $qual $filename.$extension -o $filename.webp
	done
	rm *.png
	popd

done
