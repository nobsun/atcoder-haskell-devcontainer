# AtCoder Haskell Devcontainer

このDevcontainerは、プログラミング言語HaskellでAtCoderコンテストに参加するための開発環境を、提供するものです。

## 概要

[AtCoderコンテスト](https://atcoder.jp/home)、特にABC（AtCoder Beginner Contest）に参加するときの開発環境を提供します。

- **補助コマンド群**
    - `atcoder-new`: コンテストIDを指定して、そのコンテスト用のサブディレクトリを生成。以下のコマンドスクリプトをそのサブディレクトリ内に設置
        - `activate`: 当該コンテスト用サブディレクトリ内での事前準備
        - `initializing`: 各問題ごとのサブディレクトリを準備、入出力例データを取得、配置
        - `resetting`: 取り組む問題IDの設定
        - `checking`: 取り組んだプログラムのチェック
        - `submitting`: 取り組んだプログラムの提出
        - `ghcing`: 取り組んだプログラムのREPLへのロード
        - `building`: 取り組んだプログラムのビルド
        - `executing`: 取り組んだプログラムの起動

- **ビルド関連**
    - [GHCup](https://www.haskell.org/ghcup/): 以下のツール群のインストーラ
        - [Stack](https://docs.haskellstack.org/en/stable/): ビルド、パッケージ管理ツール
        - [Cabal](https://www.haskell.org/cabal/): ビルド、パッケージ管理ツール
        - [GHC](https://wiki.haskell.org/GHC): コンパイラ、Repl
        - [HLS](https://haskell-language-server.readthedocs.io/en/latest/): Haskell Language Server

- **AtCoderとの接続**
    - [online-judge-tools](https://github.com/online-judge-tools/oj)
    - [atcoder-cli](https://github.com/Tatamo/atcoder-cli)
    - [aclogin](https://pypi.org/project/aclogin/)

## 事前準備

以下を事前にインストールしておいてください。

- [Docker](https://www.docker.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
    - **Dev Containers** 拡張機能

## 環境構築に必要な設定ファイル

リポジトリにある以下の2つのファイルは、あなた個人の状況にあわせて、あらかじめ編集し所定のファイル名で保存してください。

**.devcontainer/.env**
- `.devcontainer/.env.example` ファイルを `.devcontainer/.env` にコピーしてください。
- `.devcontainer/.env`では`ATCODER_REVEL_SESSION`の値を、あなたが AtCoder にブラウザでログインしたあとのセッションクッキー`REVEL_SESSION`の値に設定してください。

**.devcontainer/stack_conf/config.yaml**
- `.devcontainer/stack_conf/config.yaml.example` ファイルを `.devcontainer/stack_config/config.yaml` にコピーしてください。
- `.devcontainer/stack_conf/config.yaml` では、`author-name`、`author-email`、`copyright` の項目の値を設定してください。

## Dev Container

上の準備が済んだら、Dev Container 拡張機能のコマンド `Rebuild and Reopen in Container` を実行してください。
環境によりますが、15分あるいはそれ以上の時間がかかることがあります。ゆっくり、お待ちください。

## 使用例

以下で紹介する補助コマンドはすべてシェルスクリプトです。バックエンドツールが提供するバイナリーコマンドを使うラッパーコマンドになっています。
`atcoder-new`は`$HOME/.local/bin/`に保存されています。それ以外の `ing` が付いた名前のものは、`atcoder-new`を呼ぶたびに、コンテストごとのサブディレクトリにその作成されます。

### 問題の設定と解答方法（例：AtCoder Beginner Contest 472）

#### 1. コンテスト用ディレクトリの作成

```
cd $WORKSPACE_DIR/AtCoder
atcoder-new abc472
```

#### 2. コンテスト用ディレクトリに移動

```
cd abc472
```

#### 3. コンテスト用ディレクトリの準備

```
bash -e activate
```

#### 4. 問題ごとのサブディレクトリの作成と入出力例データの取得

```
./initializing
```

このコマンドは当該コンテストと開催前には使えません。

#### 5. 問題の選択

問題 A に取り組む場合（必ず小文字で指定すること）

```
./resetting a
```

#### 6. 解答プログラムの編集

問題 A に取り組む場合 `app/a/Main.hs` を編集する。

#### 7. 解答プログラムのチェック

```
./checking
```

#### 8. 解答プログラムの提出

```
./submitting
```

**N.B.**： このコマンドは、当該コンテスト開催中でのみ有効です。終了後は、Web Browser からの提出となります。

#### 9. コンテストごとのディレクトリの構成

```
abc472
├── ChangeLog.md
├── LICENSE
├── README.md
├── Setup.hs
├── abc472 -> ./app
├── abc472.cabal
├── activate
├── app
│   ├── Main.hs
│   ├── a
│   │   ├── Main.hs
│   │   └── test
│   │       ├── sample-1.in
│   │       ├── sample-1.out
│   │       ├── sample-2.in
│   │       ├── sample-2.out
│   │       ├── sample-3.in
│   │       └── sample-3.out
│   ├── b
│   │   ├── Main.hs
│   │   └── test
│   │       ├── sample-1.in
│   │       ├── sample-1.out
│   │       ├── sample-2.in
│   │       ├── sample-2.out
│   │       ├── sample-3.in
│   │       └── sample-3.out
│   ├── c
│   │   ├── Main.hs
│   │   └── test
│   │       ├── sample-1.in
│   │       ├── sample-1.out
│   │       ├── sample-2.in
│   │       ├── sample-2.out
│   │       ├── sample-3.in
│   │       └── sample-3.out
│   ├── contest.acc.json
│   ├── d
│   │   ├── Main.hs
│   │   └── test
│   │       ├── sample-1.in
│   │       ├── sample-1.out
│   │       ├── sample-2.in
│   │       ├── sample-2.out
│   │       ├── sample-3.in
│   │       └── sample-3.out
│   ├── e
│   │   ├── Main.hs
│   │   └── test
│   │       ├── sample-1.in
│   │       └── sample-1.out
│   ├── f
│   │   ├── Main.hs
│   │   └── test
│   │       ├── sample-1.in
│   │       ├── sample-1.out
│   │       ├── sample-2.in
│   │       └── sample-2.out
│   └── g
│       ├── Main.hs
│       └── test
│           ├── sample-1.in
│           ├── sample-1.out
│           ├── sample-2.in
│           ├── sample-2.out
│           ├── sample-3.in
│           └── sample-3.out
├── building
├── checking
├── contest.acc.json
├── executing
├── ghcing
├── hie.yaml
├── initializing
├── package.yaml
├── resetting
├── setting
├── stack.yaml
├── stack.yaml.atcoder
├── stack.yaml.lock
└── submitting
```
