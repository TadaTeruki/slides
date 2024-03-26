---
marp: true
title: template
math: mathjax
author: Teruki TADA
paginate: true
footer: Rust製Linuxウインドウマネージャ開発を通じた良い設計へのアプローチ
---

<style>

footer {
    color: rgb(200, 200, 200);
    width: 100%;
}

section::after {
  color: rgb(200, 200, 200);
  content: attr(data-marpit-pagination) '/' attr(data-marpit-pagination-total);
}

section {
    background: linear-gradient( rgba(30, 35, 30, 0.9), rgba(30, 30, 30, 1.0) ), url(resources/wm.png);
    background-size: cover;
    background-position: center;
    color: rgb(240, 240, 240);
}

em {
    font-weight: normal;
    font-size: smaller;
    color: rgb(200, 200, 200);
}

section h1,h2,h3,h4 {
    color: rgb(110, 190, 130);
}

section h5 {
    color: rgb(240, 240, 240);
    font-size: 1.7em;
}

section a:link {
    color: rgb(150, 200, 220);
}
</style>

Rust製Linuxウインドウマネージャ開発を通じた
# 良い設計へのアプローチ

多田 瑛貴 Teruki TADA
*公立はこだて未来大学 システム情報科学部*

![bg right:35%](resources/wm.png)

---

# ウインドウマネージャ (WM) とは

コンピュータのGUI上で、ウィンドウの表示・非表示
位置関係、前後関係などの管理を行うソフトウェア

<br>

*参考: Window manager - ArchWiki*
*https://wiki.archlinux.org/title/Window_manager*

---

# プロジェクトの背景

LinuxのGUIシステムのベースとなっているX11プロトコルは
仕様が古く、複雑である
*後継となるWaylandについては、最後に説明*

既存のWMの多くはCで実装されており、開発効率や機能の抽象化
メモリ安全性に課題を有する

---

# プロジェクトの内容と目的

X11という古いモデルから、良い設計を検討
Rust言語を用いて、モデルケースとなるWMを開発

---

# X11プロトコルの全体像

---

# X11 WM開発における課題

1. XServerとWMとの**状態の分離** 
2. **X11環境への依存**

---

# 課題1: 状態の分離

位置・大きさ・前後関係等など
ウインドウの状態は**XServer側**が持つが

それらを操作するのは**WM側**

---

# 課題1: 状態の分離

操作のたびに、状態の取得や変更のための通信が発生

**キャッシュをしない場合**
冗長な通信によるパフォーマンス低下


**キャッシュをする場合**
状態が複製され、変更時に整合性が取れない場合がある

---

# 課題1: 状態の分離

本プロジェクトにおいては

 - キャッシュ寿命の管理など、構造が複雑化が予想される
 - ローカルで動くことだけを考えれば、通信の負担は大きくない

**原則キャッシュをせず、常に問い合わせる** 判断へ

*これは、WMのユースケースに強く依存*
*X11Forwardingでのリモート操作をサポートする場合は再検討の必要あり*

---

# 課題2: X11環境への依存

X11に依存する処理を分離したい

 1. **テスタビリティ**
    基本、GUIの実環境でしかテストできない
    テストの効率が悪い・動作ケースを網羅できない
 1. **他環境への移植性**
    X11以外の環境でも、少ない実装の変更で対応できると良い

---

# 課題2: X11環境への依存

**他環境への移植性** について

X11とそれ以外で、ソフトウェアのモデルが大きく変わる
抽象化できる層が薄く、効力を発揮しない

よって、この点は考慮しないことに

*X11の問題点の多くは、そもそもX11のモデル自体の複雑性に起因している*

---

# 課題2: X11環境への依存

**テスタビリティ** について

以下の処理は分離し、独立してテストできる

1. **ウインドウの位置・大きさの計算**
   整合性の求められる部分を隠蔽

2. **装飾の描画内容**
   描画機能を別ライブラリに委譲 (Cairo)
    ウインドウに描画する代わりに、画像で出力する

---

# 構造の全体像

---

# 成果物デモ

---

# Waylandプロトコルによる解決