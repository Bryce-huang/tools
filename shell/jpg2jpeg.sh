#!/usr/bin/env bash

# 使用cwebp 转 webp 转png https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0-windows-x64.zip
# 使用 png2jpeg 转jpeg https://github.com/mateuszdyminski/png2jpeg


src=$1
dest=$2
quality=${3:-80}
quality2=${4:-75}

# jpg to webp
files=`find $src -name "*.jpg"`

for file in ${files[*]}
do
  name=${file%.*}
  cwebp -q ${quality} ${file} -o ${name}.webp

done


# webp to png

files=`find $src -name "*.webp"`

for file in ${files[*]}
do
  name=${file%.*}
  dwebp ${file} -o ${name}.png
  rm -f $file
done
#png to jpeg


files=`find $src -name "*.png"`
for file in ${files[*]}
do
  name=${file%.*}
  png2jpeg ${file} ${name}.jpeg $quality2
    rm -f $file
done