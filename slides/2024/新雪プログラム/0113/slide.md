---
marp: true
title: 新雪プログラム 8合目会議
theme: default
author: Teruki TADA
paginate: true
footer: 'ゲーム・映像表現の可能性を広げる 地形生成ライブラリの開発'
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
    background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.6) ), url(resources/asahi.webp);
    background-size: cover;
    background-position: center;
    color: rgb(240, 240, 240);
}

em {
    font-weight: normal;
    font-size: smaller;
    color: rgb(200, 200, 200);
}

section h1,h2,h3,h4,h5,h6 {
    color: rgb(240, 180, 80);
}

section a:link {
    color: rgb(150, 200, 220);
}
</style>

**ゲーム・映像表現の可能性を広げる**
# 地形生成ライブラリの開発

多田 瑛貴 Teruki TADA
*公立はこだて未来大学 システム情報科学部*

![bg right:35%](resources/terrain2.webp)

---

# プロジェクト概要

**地形学の数理モデルを取り入れた
汎用性の高いオープンな地形生成ソフトウェア・ライブラリ**

---

# 地形生成について

コンピュータによる地形生成は
Minecraftをはじめ多くのゲームで実装されている

*(写真) 上: MineCraft、下: OpenTTD*

![bg right:30% vertical](resources/minecraft.png)
![bg right:30% brightness:1.2](resources/openttd.png)


---

# 地形生成について

単純なノイズの重ね合わせで生成されることが多い

![bg right:30% vertical](https://user-images.githubusercontent.com/69315285/150670142-3a5530cf-30f3-4dd7-9d34-36e9aec0c988.png)
![bg right:30% vertical](https://user-images.githubusercontent.com/69315285/150670088-e690b5f4-b15f-4950-b959-a143277994f1.png)

----

# 思っていること

先行事例について
それぞれの要件には即しているかもしれないが、物足りない

**よりリアルかつ雄大な**地形が生成されるのを見てみたい

---

# 雄大な地形？

---

写真: 広島県福山市 - 仙酔島

![bg](resources/tomo.jpg)

---

写真: 広島県福山市 - 仙酔島

![bg](resources/tomo2.jpg)

---

# 雄大な地形の条件

多くは、河川・氷河の侵食作用に起因

![bg right:45%](resources/hidaka.jpg)
![bg vertical](resources/hidaka_chiriin.png)

*写真: 北海道新ひだか町静内の風景と
その標高データ (出典:地理院地図)*

---

# 地形学研究における地形生成

河川・氷河の侵食作用を再現した地形生成のモデルは、既に存在


主に**地形学の研究**として研究されている

---

# 地形学研究における地形生成

地形の形成過程の分析
数理モデルを用いたシミュレーション
*例: **badlands** (https://pypi.org/project/badlands/)*
*写真は上記リンクより*

![bg right:40% w:500](resources/badlands.jpg)

---

# 地形学研究における地形生成

パラメータが厳密であり、扱うのに専門知識が必要
実行環境も限定される (Python, MATLAB)

**ゲーム等のメディア用途には向いていない**

---

# プロジェクトの目標

**地形生成のためのソフトウェア**の開発

 - 地形学の数理モデルを導入
 - パラメータは必要最低限
 - 多くの用途・実行環境に対応


*かつ、それがオープンかつ汎用的であると嬉しい*


![bg right:40%](resources/tomo.jpg)

---

# 成果物

![bg right:35%](resources/terrain2.webp)

---

# 成果物デモ

**https://fastlem.peruki.dev**

![bg right:50%](resources/fastlemweb.png)

---

# Web地図フレームワークによる3D可視化

Maplibre GL JSによる3D地図

**https://prototype-web-map.fastlem.peruki.dev/**


---

# 成果物概要

**fastlem** - https://github.com/TadaTeruki/fastlem

プログラム言語: Rust
WebAssembly対応、JSでも実行可能

![bg right:40%](https://raw.githubusercontent.com/TadaTeruki/fastlem/main/images/out/terrain_generation_advanced.png)


---

# 今後の目標

地形生成の目標は概ね達成

手続き的生成等に関する様々な制作物のサンドボックスに活用予定

手続き的に生成されたデータのみで**素敵な世界を作ってみたい**

---

*上: 拡張L-systemに基づく交通網生成*

*下: マルコフ連鎖による地名生成*

![bg right:55% vertical](resources/transport.png)
![bg right:55% 90% vertical](resources/placename.png)

---

**ゲーム・映像表現の可能性を広げる**
# 地形生成ライブラリの開発

多田 瑛貴 Teruki TADA
<br>

**ありがとうございました**

![bg right:40%](resources/asahi.webp)