#!/bin/bash

# インストール系

# 通常のコマンド
ssh -V &>/dev/null    # ssh
if [ $? -ne 0 ]; then # if ! ssh -V &>/dev/null; then と一行でも書ける
  echo "Started installing the tool because I couldn't find it..."
  apt-get install -y openssh-client
else
  echo "Installed: ssh"
fi

# homebrew
if ! brew -v &>/dev/null; then
  echo "Homebrewが見つからないため、インストールを開始します..."
  echo "権限が必要な場合はパスワードを入力してください"
  echo "うまく動作しない場合、手動でhomebrewをインストールして再度試してみてください"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Installed: homebrew"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
commands=(
  curl
  jq
  coreutils
)
for command in "${commands[@]}"; do
  if ! brew list --formula | grep -qx "$command"; then # `! curl --version &>/dev/null`だと、プリインストールなどのhomebrew経由ではない場合にアップデートに失敗し、パスの設定もされない可能性がある
    echo "${command}が見つからないため、インストールを開始します..."
    echo "権限が必要な場合はパスワードを入力してください"
    brew install "$command"
  else
    echo "Installed: ${command}"
    if brew outdated --formula | grep -qx "$command"; then
      brew upgrade "$command"
    fi
  fi
  export PATH
  PATH="$(brew --prefix "$command")/bin:$PATH"
done

# sdkman
curl -s "https://get.sdkman.io" | bash
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk_default_ver=$(curl -s https://api.sdkman.io/2/candidates/default/java)
echo "n" | sdk install java "$sdk_default_ver" # sdk... <<<'n'でも動くはず
sdk use java "$sdk_default_ver"
