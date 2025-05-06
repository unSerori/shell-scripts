# shell-scripts

自分用のシェルスクリプトまとめ

## 逆引き

[空ファイルを作成する](./create_date_file.sh)  
[呼び出し元では無く、呼び出されたスクリプト側のディレクトリで実行するために、移動](./cd_scr_pwd.sh)  
[引数でディレクトリを渡されていたら移動](./cd_arg_dir.sh)  
[一度きりスケジュールを登録](./schedule_only_once.sh)  
[特定のファイルを監視する](./watch_file.sh)  
[受け取ったディレクトリにログを出力する](./try_log_at_specif_dir.sh)  
[スクリプトのカレントディレクトリに移動し環境変数を読み込む初期化処理](./init.sh)  
[インストール系の処理集](./installs.sh)

## 権限

- bashで実行する**スクリプト**はbashが読み込んで実行するので**読み込み権限のみ**あればいい `chmod 744 hoge.sh hogera.sh...`
- スクリプト内からsourceで読み込まれる**スクリプト**も同様
- 直接実行する**コマンド**には**実行権限**が必要 `chmod 755 piyo.sh piyora.sh...`
