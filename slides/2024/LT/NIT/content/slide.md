---
marp: true
title: Simulationも可視化も、クライアントサイドで - WebAssemblyを用いたインタラクティブシミュレーションの実装
math: mathjax
author: Teruki TADA
paginate: true
footer: 'Simulationも可視化も クライアントサイドで'
---

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+JP&display=swap');

section {
    font-family: 'Noto Sans JP'
}

footer {
    color: rgb(200, 200, 200);
    width: 100%;
}

section::after {
  color: rgb(200, 200, 200);
  content: attr(data-marpit-pagination) '/' attr(data-marpit-pagination-total);
}

section {
    background: linear-gradient( rgba(255, 255, 255, 1.0), rgba(250, 250, 250, 1.0) ), url(resources/miraisaiLT.jpeg);
    background-size: cover;
    background-position: center;
    color: rgb(90, 90, 90);
}

em {
    font-weight: normal;
    font-size: smaller;
    color: rgb(130, 130, 130);
}

section h1,h2,h3,h4 {
    color: rgb(100, 140, 150);
}

section a:link {
    color: rgb(150, 200, 220);
}
</style>

# Simulationも可視化もクライアントサイドで
WebAssemblyを用いたインタラクティブシミュレーションの実装

*公立はこだて未来大学 複雑系知能学科 B3*
*多田 瑛貴 ただ てるき*

NIT ほんわかんふぁ 2024

![bg right:13%](resources/hakodate.webp)

---

# 自己紹介

多田 瑛貴 ただ てるき

公立はこだて未来大学 複雑系知能学科
複雑系コース B3

出身: 福山 *(広島県)* → 京都 *(18年)* → 函館

![bg right:37% w:500](resources/me.jpeg)

---

# 自己紹介

主な関心
- 地理 (地図)
- Webフロントエンド
- シミュレーション
  特に手続き的モデリング

使用言語: Rust/Typescript/Go

MIERUNE Inc. 副業
LTサークルMariners' Conference 設立 & 部長

![bg right:37% w:500](resources/terrain.webp)


---

# 概要

---

## インタラクティブシミュレーションの開発

入力がユーザーから与えられ
リアルタイムで処理が行われるシミュレーション

### 最近見つけた面白いもの

- City Generator by Osker Stalberg
  https://oskarstalberg.com/game/CityGenerator/

- Fluid Simulation (with WebGL demo) by Jamie Wong
  https://jamie-wong.com/2016/08/05/webgl-fluid-simulation/

---

## インタラクティブシミュレータの2つの部品

**シミュレータ**
- シミュレーションを実行

**ビジュアライザ** 
- シミュレーションの結果を表示
- 必要に応じて、ユーザーの入力をシミュレータに適用

*インタラクティブシミュレーションに限らず、*
*複雑な処理+ビジュアライザという関係は様々なケースに存在*

---

## ビジュアライザをどのように開発するか

**(伝統的な) デスクトップアプリケーションとして作る場合...**

- 環境依存
- モダンなUIの組み立てづらさ
- 各ツールのコミュニティの小ささによる知見の不足

---

## ビジュアライザをどのように開発するか

**Webフロントエンドを使うという方向性を検討してみる**

- View部分をWebフロントエンドとして開発し
  シミュレーション部分と入出力を通信

*TauriやElectronのアプローチもこちら側に含めるとする*

---

# 今回の発表

インタラクティブシミュレーションの開発に
ビジュアライザにWebフロントエンドを用いる

 - なぜWebフロントエンド？
 - 連携の構成について

---

# 技術的背景: なぜWebフロントエンド？ 

---

## シミュレーション実装によく用いられる言語
- C, Python, Rustなど
- 各種計算ライブラリが充実し、かつ高速
- 静的型付けであれば、実行時エラーの原因となる
  デリケートな処理を比較的安全に扱える

一方で
 - GUI/グラフィックスの機能は、比較的扱いづらい場合が多い

---

## Webフロントエンド (JS/TS)

- GUI/グラフィックスを扱うのに向いている
  - 豊富な開発ツール + 高度な標準API
    - GUIを構築するフレームワークの多様性は言わずもがな
    - グラフィックス系のライブラリも、Canvas2D・WebGLを源流として
    Three.jsやd3のようなプリミティブなもの、
    統計・地図ライブラリなど機能を限定したものまで様々
  - それぞれのコミュニティ人口の多さも強い
    - 変化は激しいが、将来性がある

---

## Webフロントエンド (JS/TS)

一方で、シミュレーションの実装にはあまり向いていないと考えられる
- 各種計算ライブラリのバリエーション
- パフォーマンス

*ただし、深刻な問題とは言えず、JS/TSで完結する場合も多いと考えられる*
*そのアプローチについても後々考慮するとする*

---

## ビジュアライザとしてWebフロントエンドを用いる効果

Webフロントエンドの高い表現の幅を生かしながら
シミュレーションを適切な言語を使って開発できる

それだけでなく、副次的効果として

- クロスプラットフォーム性の確保
- Webサイトとして外部に公開することが視野に入る

---

# では...

シミュレータとWebフロントエンド
どのように連携するのが適切だろうか？

---

# Webフロントエンドとの連携の構成

---

## アプリケーションの形式ごとの連携方法の違い

**Webサイトの場合**
- シミュレーション用サーバーを設置するなど

**デスクトップアプリケーションの場合**
- Tauri(Rust)やWebkitGTK(C)等を用いる

今回は、後者については割愛
Webサイトとして作成/グローバルに公開する形式を想定

---

## 方針: シミュレーション用サーバーを立てる

入出力を受け付けるサーバーを設置し、シミュレーションをそこで行う

**具体的なアプローチ**
- (1) 仮想/自宅サーバーで動かす
- (2) FaaSで動かす

---

### (1) 仮想/自宅サーバーで動かす 

**特徴**
- 費用次第でマシンの性能を無限に拡張可能
- 費用対効果は薄い
  - アクセス数やシミュレーションの重さ次第で費用が膨れ上がる
  - セキュリティへの配慮が必要となる場合もあり
- とにかく、管理が面倒
  - 実行時エラーでサーバーが止まるなども考え得る

---

### (2) FaaS (Workers / Lambdaなど) で動かす

**特徴**
- 管理の手間やコストは抑えられる
- リソースは限られる
  - メモリの制限に引っかかる可能性
  - 処理の性能上、レスポンス速度にも問題が生じ得る

---

## シミュレーション用サーバーの利点と欠点

**利点**
- クライアントサイドに計算負荷が発生しない

**欠点**
- 要件によっては、そもそも採用できない
  - 例えば、時間変化中もユーザーの入力を受け付けたい場合
  *WebSocketなどを使っても限界ありと思われる*
- サーバー・クライアント側のコードの両方で
  リクエスト・レスポンスの受け渡しの処理を記述する必要がある


---

## シミュレーション用サーバーが向いている場合

- ユーザーが個人のみ or 少ない
- クライアントサイドでは処理できない都合がある
  - 処理の重さ
  - アルゴリズムの秘匿性

*広義に言えば、ChatGPTなどもこの方法に該当する*

---

## 方針: 静的サイトとして提供する

入出力の受け付けからシミュレーションまで、すべてフロントエンドで完結

**具体的なアプローチ**
- (1) JS/TSでシミュレータを実装し、ライブラリとして提供する
- (2) WebAssemblyでビルドし埋め込む

---

### JS/TSでシミュレータを実装し、ライブラリとして提供する

**特徴**
- 構造が最も単純
- シミュレータをJS/TSで実装する必要がある、というのが
  唯一かつ最大の制約
  - 前述したシミュレータ実装向きの言語を使えない

---

### WebAssemblyでビルドし埋め込む

**特徴**
- RustやGoなどの言語を、WebAssemblyでビルドし
  フロントエンドに埋め込む
  - CI/CDで自動化するとより良い
- WebAssemblyビルドに対応する言語(処理系)なら使える
  - バリエーションは今後も増えていく可能性

---

## 静的サイトとして提供する利点と欠点

**利点**
- ビジュアライザ実装側のクラスや関数を直接呼び出すため
  実装がシンプルに収まる
- 実装の構造上、ネットワークを経由する通信も必要ない
  時間変化中もユーザーの入力を受け付けるなど、
  リアルタイム性の求められる要件にも対応

**欠点**
- 重い処理をクライアントで行うため
  しばしばブラウザ全体が硬直する
  *クライアントの性能が低いと、なおさら*

---

# 静的サイトとして提供する方法の優位性


Cloudflare Pages、GitHub Pagesをはじめ
静的サイトのホスティングは無料で間に合う場合が多い
  
- 費用負担が最小限
- モノレポ、かつデプロイ先も一つで済む

全体として、管理の負担がほとんどないのは魅力

多くのユースケースではこちらの方が望ましいと考えられる
*個人や少人数向けでもこちらで十分*

---

# 個人開発での事例

Hokkaido Generatorの場合

- シミュレータをRustで作成し、WebAssemblyビルド
- TypeScript+Svelteでビジュアライザを作成
- GitHub ActionsでWebAssemblyを埋め込み

---

# まとめ

モダンなインタラクティブシミュレータ開発

- WebAssemblyビルドに対応する言語でシミュレータを記述
- Webサイトとしてビジュアライザを実装
- CI/CDで埋め込み

近年のWeb開発のエコシステムの利便性を生かし
管理の負担とコストを極力省く構成を実現