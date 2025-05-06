#!/bin/bash

# 空ファイルを作成する
# 呼び出し側のディレクトリに作成するが、引数を受け取った場合、その場所で作成する
# なお、ディレクトリは末尾の/まで書くこと

FILE_BASE_NAME="try_file"
FILE_EXT=".sh"

# .の有無を揃えるために、先頭の.を削除して追加する
EXT_WITHOUT_DOT="${FILE_EXT:+${FILE_EXT#.}}"
EXT_WITH_DOT="${EXT_WITHOUT_DOT:+.${EXT_WITHOUT_DOT}}"

touch "${1}${FILE_BASE_NAME}$(date +%Y%m%d_%H%M%S)${EXT_WITH_DOT}"
