#!/bin/bash

# 空ファイルを作成する
# 基本的にスクリプトがあるディレクトリで作成するが、引数を受け取った場合、その場所で作成する

sh_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # 実行場所を相対パスで取得し、そこにサブシェルで移動、pwdで取得
cd "$sh_dir" || {
    echo "Failure CD command."
    exit 1
}

if [ $# -gt 0 ]; then
    cd "$1" 2>/dev/null || {
        echo "Failure CD command."
        echo "The directory passed as an argument is not valid."
        echo "Running in the script's current directory."
    }
fi

FILE_BASE_NAME="try_file"
FILE_EXT=".a"

# .の有無を揃えるために、先頭の.を削除して追加する
EXT_WITHOUT_DOT="${FILE_EXT:+${FILE_EXT#.}}"
EXT_WITH_DOT="${EXT_WITHOUT_DOT:+.${EXT_WITHOUT_DOT}}"

touch "${FILE_BASE_NAME}$(date +%Y%m%d_%H%M%S)${EXT_WITH_DOT}"
