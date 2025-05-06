#!/bin/bash

# 受け取ったディレクトリにlogを作成する
# 呼び出し側の責務: ディレクトリは最後の/を含めて渡す

LOG_DIR="${1}"
OUT_LOG_PATH="${LOG_DIR}log.out.log"
ERR_LOG_PATH="${LOG_DIR}log.err.log"

{
  echo "date: $(date)"
  echo try_log_at_specif_dir.sh
  cmd >>"$OUT_LOG_PATH" 2>>"$ERR_LOG_PATH"
  echo
} >>"${1}log.log"
