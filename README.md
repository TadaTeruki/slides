# ぺるきのスライド集
**https://slides.peruki.dev/**

<br>

スライドの本体は`slides`内にあります。

以下のコマンドにて内容を更新できます。
```
$ make build-all
```

新しいスライドを反映するには、スライド本体のファイルと同じ場所に`info.txt`が必要です。<br>
以下のようなフォーマットで記述してください:
```
source---       index.html
date---         yyyy/mm/dd
title---        スライドのタイトル
description---  スライドの説明
```

`git push origin main`すれば自動的にデプロイされます。

Copyright (c) 2023 Teruki TADA

