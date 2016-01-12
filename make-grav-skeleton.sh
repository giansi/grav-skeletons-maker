#!/bin/sh

dir="gravstrap-skeleton"
repo="git@github.com:giansi/gravstrap-theme-skeleton.git"
theme="gravstrap-theme"

rm -rf $dir
composer create-project getgrav/grav $dir

if [ ! -d $dir ]; then
  echo $dir" does not exist"
  exit
fi

cd $dir
if [ -d "user" ]; then
  rm -rf user
fi

git clone $repo user
rm -rf user/.git

bin/gpm install $theme
bin/grav clearcache

cd ..
zip "$dir" -r $dir
