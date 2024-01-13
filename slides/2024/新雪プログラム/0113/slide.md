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

![bg right:40%](resources/terrain.webp)

---

# プロジェクト概要

**地形学の数理モデルを取り入れた
汎用性の高いオープンな地形生成ソフトウェア・ライブラリ**

メディア用途に応用可能な
高品質な地形を容易に生成する計算基盤を提供

---

# 地形生成の課題

**メディア用途**
 - CG的アプローチ
   - ノイズ(パーリンノイズ)の重ね合わせが多い
   - 地形本来の雄大さを再現できない

**研究用途**
 - ライトに使うには厳密すぎるパラメータ
 - 限定される実行環境 (Python, MATLAB)

![bg right:30% vertical](resources/minecraft.png)
![bg right:30% brightness:1.2](resources/openttd.png)

---

# プロジェクトの動機

地形学の数理モデルを取り入れつつ
ライトに扱うことのできる計算基盤を作りたい

*かつ、それがオープンかつ汎用的であると嬉しい*

---

# 成果物デモ

https://prototype-web-map.fastlem.peruki.dev/

---

# 成果物概要

**fastlem** - https://github.com/TadaTeruki/fastlem

プログラム言語: Rust
WebAssembly対応、JSでも実行可能

![bg right:40%](https://raw.githubusercontent.com/TadaTeruki/fastlem/main/images/out/terrain_generation_advanced.png)

---

**ゲーム・映像表現の可能性を広げる**
# 地形生成ライブラリの開発

多田 瑛貴 Teruki TADA
<br>

**ありがとうございました**

![bg](resources/asahi.webp)