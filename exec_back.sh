#!/bin/bash

# バックグラウンドで実行
# nohup hoge &

command="./try_log_at_specif_dir.sh ./"

eval "nohup ${command} &"
