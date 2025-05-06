#!/bin/bash

# 全てのディレクトリに対してループ処理

target_dir=../

find "$target_dir" -mindepth 1 -maxdepth 1 -type d -print0 | while read -d $'\0' dir; do # -print0は最後に指定する必要がある # find -print0で出力の区切りがnull文字になっているため、$'\0'（null文字）で区切る
  echo $dir
done
