#!/bin/zsh

cd ~/readinglist

DIR=".git"

if [ ! -d $DIR ];then
  echo "git初期化,remote登録,空コミット,pushして"
  exit 1
fi

if [ -d $DIR ];then
  local current_branch=$(git symbolic-ref --short HEAD)
  git branch --set-upstream-to=origin/$current_branch $current_branch

  git pull
fi
