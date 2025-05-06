#!/bin/bash

# 特定のファイルを監視する
# ログの場所は/var/log/audit.log

WATCHED_FILE="/etc/resolv.conf"
ADJUSTED_WATCHED_FILE=${WATCHED_FILE//\//_} # //a/b
ADJUSTED_WATCHED_FILE=${WATCHED_FILE// /_}  # //a/b

auditctl -l | grep "${WATCHED_FILE}" >/dev/null
if [ $? -ne 0 ]; then
    sudo auditctl -w "${WATCHED_FILE}" -p rwxa -k watch_file_${ADJUSTED_WATCHED_FILE}
fi

auditctl -l

sudo auditctl -a always,exit -F arch=b64 -S execve

#tail -f /var/log/audit.log
#ausearch -i -k watch_file_${ADJUSTED_WATCHED_FILE}

#ausearch -m execve
