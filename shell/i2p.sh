#!/bin/bash
. ./var
target=$3
target=${target:-"private.com"}
repository=$2
repository=${repository:-"library"}
docker pull "$1"
image=$(echo "$1" | awk -F "/" '{print $NF}')
newimage=$target'/'$repository'/'$image
echo $newimage
# shellcheck disable=SC2016
echo 'the new image is' "$newimage"
docker tag "$1" "$newimage"
# shellcheck disable=SC2154
docker login $target -u "$user" -p "$pass"
docker push "$newimage"
echo 'successfully pushed' "$newimage"
docker rmi -f $1
docker rmi -f $newimage
echo 'successfully clean images' 
