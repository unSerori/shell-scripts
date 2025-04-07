#!/bin/bash

# 呼び出し元では無く呼び出されたスクリプト側のディレクトリで実行するために、移動

sh_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # 実行場所を相対パスで取得し、そこにサブシェルで移動、pwdで取得
cd "$sh_dir" || {
    echo "Failure CD command."
    exit 1
}
