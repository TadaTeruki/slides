---
marp: true
title: 新雪プログラム ブースト会議
theme: perutheme0
author: Teruki TADA

---

**ゲーム・映像表現の可能性を広げる**
# 地形生成ライブラリの開発

<br>

多田 瑛貴
*公立はこだて未来大学 システム情報科学部*

![bg right:40%](square.png)

---

# 自己紹介

**多田 瑛貴** ただ てるき

*公立はこだて未来大学 システム情報科学部 複雑系知能学科 複雑系コース 2年*

**HP**&emsp;portfolio.peruki.dev
**X(Twitter)**&emsp;@PerukiFUN
**GitHub**&emsp;TadaTeruki


![](./welcome.png)

---

# 自己紹介

**主要分野**
 - 手続き的生成

![bg right:60%](https://firebasestorage.googleapis.com/v0/b/portfolio-server-77440.appspot.com/o/images%2Farticles%2F7ee8cf04-a809-40d8-bf1f-d0c03633930d%2Fdisplayed.jpg?alt=media&token=0af628b3-2b0c-4056-8fde-034c206c8c8a)

---

# 自己紹介

**主要分野**
 - 地理情報システム (最近から)

*写真: roadside-explorer.peruki.dev*

![bg right:40%](./RoadsideExplorer.jpg)

---


# プロジェクト概要

<br>

**高品質な地形データを生成する地形生成ライブラリの開発**

![](landscape.png)

*実際に試験的に生成したもの*

---

# 地形生成とはなにか

地形生成は、主にゲーム開発で用いられる技術
- 「パーリンノイズ」と呼ばれる特殊なノイズを重ね合わせる方法が主流
- Minecraftのワールド生成などで知られる

*写真: OpenTTD, Minecraftの例*

![bg vertical brightness:120%](openttd.png)
![bg right:30%](minecraft.png)

---

# 現状の課題

現存の地形生成の方法は、表現の幅に限界があると考えている

---

![bg](tomo.jpg)


---

![bg](tomo2.jpg)

---

![bg](innnoshima.jpg)

---

![bg](minecraft.png)

---

![bg vertical](innnoshima.jpg)
![bg vertical](minecraft.png)

---

![bg brightness:120%](openttd.png)

---

# 既存手法の限界

ダイナミックでも、リアルとは言えない

**なぜ？**

特殊なノイズ (パーリンノイズ) の重ね合わせによる手法は
純粋に計算機科学的アプローチであり、実際の地形の仕組みに即していない


---

# よりよい地形への追求


実世界の多様な海岸線の形
尾根と谷の連なる雄大な山の風景など

河川・氷河の侵食作用や
地殻の隆起といった**地形作用**に起因

![bg right:45%](hidaka.jpg)
![bg vertical](hidaka_chiriin.png)

*写真: 北海道新ひだか町静内の風景と
その標高データ (出典:地理院地図)*

---

# 提案する解決策

実世界の地形作用を厳密に再現することは計算機上では不可能

一方で、**地形学分野の数理モデルを取り入れる**ことで
近似的な再現へのアプローチは可能

実際に、数理モデルに基づいて
計算機上で仮想的な地形を生成する試みとして
**「地形進化モデル」(Landscape Evolution Model, LEM)** 
と呼ばれる地形学の研究分野がある

---

# 先行研究の例

*Guillaume Cordonnier, Jean Braun, Marie-Paule Cani, Bedrich Benes, Eric Galin, et al.. Large Scale Terrain Generation from Tectonic Uplift and Fluvial Erosion. Computer Graphics Forum, 2016, Proc. EUROGRAPHICS 2016, 35 (2), pp.165-175. ⟨10.1111/cgf.12820⟩. ⟨hal-01262376⟩*


---

![bg](hal1.png)

---

![bg](hal2.png)

---

# 先行研究の課題点

 - 地形学の研究の範囲に収まっている
   - 目的は、数理モデルの評価
   - **ツールとしての汎用性・使いやすさは重視されてこなかった**
     - 正しく扱うには地形学の知識が必要 (パラメータなど)
     - MATLAB専用など、実行環境も限定される

 - **オープンかつ汎用的なライブラリを作りたい**

---

# 開発中のプロダクトのプレビュー

**Rust言語**による実装

---

無地のデータに対して
地形作用処理を
適用したもの

![bg right:60%](lem.png)

---

![bg](lem.png)
![bg](chiriin2.png)

---

パーリンノイズに対して
地形作用処理を
適用+着色したもの
*検証用*

![bg right:60%](square.png)

---

![bg](square.png)

---

# 具体的な技術構成

 - 地形生成ライブラリを**Rust**にて開発
   - 様々なプラットフォームで扱えるよう**WebAssemblyに対応**
 - ビジュアライザを**JavaScript**にて開発

---

# 本プロジェクトの目標

**地形学の考え方を取り入れた
汎用性の高いオープンな地形生成ソフトウェア**

高品質な地形を容易に生成するツールの存在は
ゲーム開発・映像制作における表現の可能性を
大きく広げられる
![bg right:40%](square.png)

---

# 現在の進捗

 - 基盤ライブラリの製作 *60%完了*
   - パラメータの設定を文献にそのまま従った実装
   - https://github.com/TadaTeruki/terrain-rs
 - ラッパーライブラリの製作 *製作中*
   - 誰でも扱える形で基盤ライブラリにアクセスするライブラリ
 - ドキュメント *製作中*

---

# 今後の予定

 - ビジュアライザ *製作予定*
   - Web上でアクセス可能なビジュアライザ
   - **地図ライブラリ**を用いた3Dによるビジュアライザを作れないか？

![h:350](hakodate.png)

 - **サンプルゲーム**を作れないか？ *future workかもしれない*

---

**ゲーム・映像表現の可能性を広げる**
# 地形生成ライブラリの開発

<br>

多田 瑛貴
*公立はこだて未来大学 システム情報科学部*

![bg right:40%](square.png)
