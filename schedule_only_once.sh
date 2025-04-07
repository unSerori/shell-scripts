#!/bin/bash

# スクリプトを一度きり実行する

TARGET_SCRIPT_FILE="/path/to/script.sh"
EXE_MIN="25"
EXE_H="12"
EXE_D="7"
EXE_MON="4"
EXE_DOW="*" # *

TIME="${EXE_MIN} ${EXE_H} ${EXE_D} ${EXE_MON} ${EXE_DOW}" # 分 時 日 月 曜日

echo "$TIME"
echo "$TARGET_SCRIPT_FILE"

# 一度きりタスク登録するために、「スクリプト実行後に、一覧から自分自身をのぞいた全てを再登録するタスク」を登録する
(
    crontab -l 2>/dev/null | grep -v "${TARGET_SCRIPT_FILE}"
    echo "${TIME} ${TARGET_SCRIPT_FILE}; crontab -l | grep -v '${TARGET_SCRIPT_FILE}' | crontab -"
) | crontab -
