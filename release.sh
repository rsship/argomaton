#!/bin/sh

set -xe

new_ver=$1

echo "New version $1"

docker tag nginx salihbozkaya1001/nginx:$new_ver

docker push salihbozkaya1001/nginx:$new_ver

tmp_dir=$(mktemp -d)
echo $tmp_dir

git clone git@github.com:rsship/argomaton.git $tmp_dir

sed -i '' -e "s/salihbozkaya1001\/nginx:.*/salihbozkaya1001\/nginx:$new_ver/g" $tmp_dir/myapp/1-deployment.yaml

cd $tmp_dir
git add .
git commit -m "Update Image $new_ver"
git push 

rm -rf $tmp_dir

