# M2MacでDocker on Lima環境構築

## インストール
1. Rosettaインストール
    ```
    $ /usr/sbin/softwareupdate --install-rosetta --agree-to-license

    By using the agreetolicense option, you are agreeing that you have run this tool with the license only option and have read and agreed to the terms.
    If you do not agree, press CTRL-C and cancel this process immediately.
    2023-08-28 20:39:47.220 softwareupdate[67322:1816036] Package Authoring Error: 042-15018: Package reference com.apple.pkg.RosettaUpdateAuto is missing installKBytes attribute
    Installing: 0.0%
    Install of Rosetta 2 finished successfully
    ```
2. DockerDesktop for macインストール
   - [Mac に Docker Desktop をインストール](https://docs.docker.jp/desktop/install/mac-install.html#mac-docker-desktop)

## コンテナ起動手順
1. `docker images`でoracleのimageがビルドされていることを確認
   - imageがbuildされていない場合  
  `docker-images/OracleDatabase/SingleInstance/dockerfiles/buildContainerImage.sh -v 19.3.0 -e -i`
1. `limactl start docker`でlimaを起動
2. `make setup`でコンテナ起動
3. imageの再作成がしたいとき
  - `docker images rm <IMAGE ID>`
  - 再度1を行う

## Makefile作成
### 注意点
> - .PHONYを記載しないとコマンドと同じ名前のファイルがある場合衝突してしまいコマンドが実行できません。  
> - @make コマンドを使うことでコマンドをまとめて扱うことができます。  
> - @はエコーしないって意味だそうです  
> - コマンド内容のインデントはTabを使ってください。半角スペースだと動きません。

- 参考
  - [docker-composeを詠唱する黒魔術「Makefile」入門](https://qiita.com/sun33/items/d728bc9ec27129b53e17)

# Oracleコンテナとappコンテナを作る
## DockerでOracle Databaseを使う
1. [【Docker】Oracle Database19cを構築する](https://test_user.com/2022/10/01/oracle-database19c%E3%82%92docker%E3%81%A7%E6%A7%8B%E7%AF%89/)  
2. volumesについてはこちらがわかりやすい  
  [ボリューム(volumes)で何ができるか気づけたから解説！(docker-compose)](https://qiita.com/Hirochon/items/121f172fbbae8c8ad749)

# Dockerfileを作成
// TODO: アプリ用コンテナを立てたい
// なにするアプリかはまだ決めていない・・・
// oracle接続用コンテナ←いる？なにするもの？

# コマンド集
- sysdba権限でsqlplusログイン: `sqlplus / as sysdba`
- test_userでsqlplusログイン: `test_user/test_user@ORCLPDB1`
- ログを見る: `docker compose logs oracle`
- oracleコンテナに入る: `docker compose exec oracle bash`