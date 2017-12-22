# Overview

[gitで自分のコミットしたコードの行数を数える](https://qiita.com/Night___/items/359ff81f358968567a45)  
これが便利だったのでNode.jsを使ってCLI化してみた。

# Installation

[Node.js](https://nodejs.org/ja/) + [npm](https://www.npmjs.com/) が含まれている環境が必須。  
npm には登録していないが、 GitHub のプロジェクトのURLを渡せばインストールすることが可能。

また、このコマンドは内部で`git`コマンドを利用している為、gitのインストールが必要。

```Bash
$ npm -v
5.3.0

$ git --version
git version 2.15.1

$ npm install -g https://github.com/miyabisun/git-change-lines
```

# Usage

ターミナル内に `git-lines` コマンドが追加される。
gitで管理されているプロジェクトにカレントディレクトリを移し`git-lines`コマンドを実行する。

`git config user.name`で自分のユーザー名を確認した後、  
`git log`コマンドを利用しながら日付毎の変更行数を確認していく。

表示される数値は下記
`合計変更行数 (加筆行数 削除行数)`

```Bash
// default: 30days
$ git-lines
2017-10-13: 100 (+55 -45)
2017-10-12: 127 (+127 -0)

// custom days
$ git-lines 7
2017-10-13: 100 (+55 -45)
2017-10-12: 127 (+127 -0)
```

# ToDo

- コマンドライン引数をパース
- authorを任意の人に変更する機能
- ヘルプやUsageの追加
- 対象のファイルをカウントしない機能を追加(package-lock.jsonとか)

