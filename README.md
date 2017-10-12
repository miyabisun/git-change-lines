# Overview

[gitで自分のコミットしたコードの行数を数える](https://qiita.com/Night___/items/359ff81f358968567a45)  
これが便利だったのでNode.jsを使ってCLI化してみた。

# Installation

```Bash
$ npm install -g
```

# Usage

```Bash
// default: 30days
$ git-lines
2017-10-12: 127 (+127 -0)

// custom days
$ git-lines 7
2017-10-12: 127 (+127 -0)
```
