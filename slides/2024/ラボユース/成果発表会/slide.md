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
    color: rgb(100, 210, 120);
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
# よりよい設計へのアプローチ

多田 瑛貴 Teruki TADA
*公立はこだて未来大学 システム情報科学部*

![bg right:35%](resources/wm.png)

---

