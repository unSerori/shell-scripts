#!/bin/bash

# 受け取った引数をコマンドとしてバックグラウンドで実行
# nohup command arg1 arg2... &

command=("$@")

nohup "${command[@]}" &
