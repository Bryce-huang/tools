#!/bin/bash
# 图片转webp,工具下载地址：https://storage.googleapis.com/downloads.webmproject.org/releases/webp/index.html
# 支持gif 转webp，jpeg、png转webp、webp转jpg，png 官方文档：https://developers.google.com/speed/webp
# 本文介绍windows下的转换，其他环境自己搞，记得把下载文件bin目录配置一下环境变量，如我的：C:\Users\2b\Downloads\libwebp-1.1.0-windows-x64\bin
# jpeg、png 转为webp [cwebp]

#该脚本用法: 打开git bash  输入 sh images2Webp.sh imagesDir

function image2webp() {
for i in `find $1  -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" `; do
  #-q 自行修改质量
  #其他转换也类似，自己写哈
cwebp -q 80 $i -o ${i%%.*}.webp
done
}


if test -d $1
then
    image2webp $1
elif test -f $1
then
    echo "搞了个文件过来，自己直接  cwebp 就完了"
    exit 1
else
    echo "又不是目录，又不是文件，你想上天啊？"
    exit 1
fi
