---
marp: true
title: オープンソースライセンス学び直し
math: mathjax
author: Teruki TADA
paginate: true
footer: 'オープンソースライセンス 学び直し'
---
<style>
@import url('https://fonts.googleapis.com/css?family=Noto Sans JP&display=swap');

@import 'default';

section {
    font-family: 'Noto Sans JP', serif;
    background-color: #fff;
}

h1,h2,h3,h4 {
    color: #244;
    border-bottom: 1px solid #ccc;
    line-height: 1.5em;
}

em {
    color: #888;
    font-size: smaller;
}
</style>


# オープンソースライセンス 学び直し

多田 瑛貴 *ただ てるき*


---

# 目次

**オープンソースライセンスって何 (そもそも)**

 - MIT / BSD (寛容型ライセンス)

**コピーレフトについて**

 - GPL / LGPL・MPL (互恵型ライセンス)

---

# オープンソースライセンスって何 (そもそも)

---

# オープンソースの定義

OSI (Open Source Initiative) による定義が一般的
https://opensource.org/osd

定義は10項目あるが、ざっくり言うと
 - ソースコードが頒布されているよ
    (バイナリだけの頒布はできないよ)
 - 自由に改変・再頒布できるよ
 - 利用者・利用目的に制限をかけないよ

 ...といった感じ

---

# オープンソースライセンスとは

OSIが定めた「オープンソース」の定義に従い
かつOSIの承認を受けているライセンス

https://opensource.org/licenses/

*OSIからの承認 = 「license review」を通過したこと*
*https://opensource.org/licenses/review-process/*

---

# MITライセンス (The MIT License)

https://opensource.org/license/mit/

代表的なオープンソースライセンス
 - MIT(マサチューセッツ工科大学)が起源
 - 由来はX11、ほかにNode.jsなど

*GitHubの公開レポジトリで最も多く使われているらしい*
*https://innovationgraph.github.com/global-metrics/licenses#license-rankings*

---

# MITライセンスの概要

対象となるソフトウェアについて...

(1) ソースコードを制限なく利用・改変・再頒布できる
    → OSIのいう「オープンソースである」ことに従う内容

(2) 何があっても**著作者は一切責任を負わない** (免責条項)
    *対象のソフトウェアが不具合を起こして損害が生じても、全ての責任は利用者が負う*

---

# MITライセンス下のソフトウェアの利用条件

「このソフトウェアの著作権表示とライセンス表示を、
　ソフトウェアのすべての複製、あるいは重要な部分に含めること」

> *The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.*

重要なのは、独自に改変しても
**もとのソースコードを開示する義務がない**こと

---

# BSDライセンス

https://opensource.org/license/bsd-3-clause/ *(3条項)*

 - FreeBSD、OpenSSHなど
 - 利用・改変・再頒布が認められており、著作権表示と免責条項を含む
 *MITライセンスとよく似ている*
 - 2つのパターンがある
   - **3条項BSDライセンス (The 3-Clause BSD License)**
   - **2条項BSDライセンス (The 2-Clause BSD License)**
 *3条項BSDライセンスから、第3条項を消したもの*

---

# BSDライセンスの第1条項・第2条項 (共通)

「ソースコードを再頒布するなら、その中にこのソフトウェアの著作権表示・ライセンス表示・免責条項を含めること」

> *Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.*

「バイナリを再頒布するなら、頒布物のドキュメントにこのソフトウェアの著作権表示・ライセンス表示・免責条項を記載すること」

> *Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.*

---

# BSDライセンスの第1条項・第2条項 (共通)

つまり、ソースコードにしろバイナリにしろ
著作権表示・ライセンス表示・免責条項を
ちゃんと残しておけよ！ということ

言ってることはMITライセンスとだいたい変わらない

> *The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.*

*ただし、MITライセンスはソースコード/バイナリの区別が無いのでまぎらわしい*

---

# BSDライセンスの第3条項

「このソフトウェアを使った商品の宣伝や販促に
　開発した組織やコントリビュータの名前を許諾なく使ってはいけない」

> *Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.*

2条項BSDライセンスには、この条項は省かれている

---

# 「寛容型」ライセンス

MIT・2条項BSD *著作権表示 + 利用/改変/再頒布の許諾 + 権利表示の明記 + 免責条項*
3条項BSD *著作権表示 + 利用/改変/再頒布の許諾 + 権利表示の明記 + 宣伝や販促の条件 + 免責条項*

このように、条項として
もとのソースコードの開示義務を伴わないライセンスは
利用者視点で「寛容型ライセンス」と呼ばれる

---

# MIT/BSDライセンスの (開発者視点の) リスク

改変してもソースコードを開示する必要がないので...

自分のソフトウェアが、他人による改良や再頒布を経て最終的に
他の企業や個人の私有物 (=プロプライエタリソフトウェア) の
一部になってしまう可能性がある

---

# コピーレフトについて (「互恵型」ライセンス )

**「頒布条件を変更しない」** という条件のもと
利用・改変・再頒布を保証

結合著作物にも同じライセンスを適用することを求める
→ 他人によるプロプライエタリ化を防ぐ

利用者視点で「互恵型ライセンス」とも呼ばれる

---

# GPL (GNU GPL, GNU General Public License)

https://www.gnu.org/licenses/gpl-3.0.en.html

コピーレフトに基づいたライセンス
 - **自由ソフトウェア運動** (後述) が起源
 - gcc、Linuxカーネルなど

---

# GPLの概要 (抜粋)

**バイナリ(オブジェクトコード)だけの頒布はできない**
バイナリのみ渡す場合、必ずソースコードの開示に応じる必要がある
*6. Conveying Non-Source Forms. を参照*


**改変したもの、あるいは結合著作物もGPLで頒布する必要あり**
かつ他のどんな追加制限も禁止される
*5. Conveying Modified Source Versions. を参照*

など...
*当然ながら、免責条項にあたる内容も含む*

---

# GPLの序文

「ソフトウェアやその他の実用的著作物向けのライセンスの大半は、あなたから著作物を共有したり変更したりする自由を奪い去るよう設計されています。」
*(翻訳: https://gpl.mhatta.org/gpl.ja.html)*

> The licenses for most software and other practical works are designed to take away your freedom to share and change the works.


思想が強い、なぜ？

---

# 自由ソフトウェア運動について

**自由ソフトウェア運動**
ざっくり言うと、ソフトウェアの私有化に対抗する社会運動

世の中の**全て**のソフトウェアについて
「実行、コピー、配布、研究、変更、改良する自由を利用者が有する」
べきとする

*https://www.gnu.org/philosophy/free-sw.ja.html*

リチャード・ストールマンが中心
**FSF (フリーソフトウェア財団)** により推進

---

# 「自由ソフトウェア」

コピーレフトに基づくソフトウェアは「自由ソフトウェア」とされる

https://www.gnu.org/philosophy/free-sw.ja.html


目的の違う「オープンソース」とは区別される
*オープンソースは、もっとゆるい概念と言える*

---

# 「自由ソフトウェア」はオープンソース？

GPL等の自由ソフトウェアライセンスも"オープンソース"の定義は満たしている
実際、OSIはGPL等を「オープンソースライセンス」と認定している

https://opensource.org/licenses/

*「自由ソフトウェア」かつ「オープンソース」であることを示すために*
***FLOSS** (Free/Libre and Open Source Software) とか **FOSS** とかの呼称が使われることもある*

---

# GPLの (ライブラリ開発における) 問題点

ライブラリをGPLで開発した場合

結合著作物にもGPLを適用することを求めるため
ライブラリを利用する側もGPLでライセンスを選択せざるを得ない

→ 自由ソフトウェアにしか使えないライブラリに！

---

# LGPL (GNU Lesser General Public License)

https://www.gnu.org/licenses/lgpl-3.0.en.html

 - GPLと多くの部分は共通。コピーレフトあり
 - glibc、cairoなど

ざっくりと言えば
**ライブラリとして使う場合に限り**コピーレフトを緩和
別のライセンスに保護されたソフトウェアに結合することを許可する

---

# LGPLの利用条件

統合著作物について

- 対象のライブラリを使っていることを明記
- 対象のライブラリについて(改変部分含め)ソースコードを開示
- 著作物の**改変**および
どのように使われているのか調査・デバッグするための
**リバースエンジニアリングを許可する** *!?*

---

# LGPLの面倒さ

LGPL下のライブラリを使うソフトウェアは
利用者による改変やリバースエンジニアリングを認める必要がある

*利用規約に「改変やリバースエンジニアリングを禁止します」なんて書けなくなる*

---

# MPL (Mozilla Public License)

https://www.mozilla.org/en-US/MPL/2.0/

 - コピーレフトあり
 - Firefox, Thunderbirdなど

ざっくりと言えば
コピーレフトは**MPLで保護された部分にのみ適用される**
統合著作物は基本的に、別のライセンスで保護しても問題ない

---

# MPLについて

> LGPL下のライブラリを使うソフトウェアは
改変やリバースエンジニアリングを認める必要がある

ライブラリとして頒布する場合の
**LGPLのめんどくさい部分を回避できるライセンスの一つ**

*MPLについては詳細を省略。各自で調べてね*

---

# オープンソースライセンスの使い分け (個人的な例)

 - **リチャードストールマンに同意**
 → **絶対GPL**
<br>


 - 既存アルゴリズムの実装だったりして、独自性がない
 - プロプラも含め、いろいろなソフトウェアに使って欲しい]
 - **長ったらしいライセンスに反旗**
 → **MIT/BSD**


---


# オープンソースライセンスの使い分け (個人的な例)

 - 独自性がある
 - あくまで、他のソフトウェアに組み込むものとして使ってもらいたい
 → **MPL**
<br>

 - 独自性がある
 - UIをもち、独立したアプリケーションとして動く
 → **GPL**


---

# まとめ

 - オープンソースライセンスは
   著作権のもとでルールを果し、様々な利用を許諾するもの
 - (OSI的な視点では) 必ずしもコードが公開されていることが
    オープンソースであることを示さない
 - 自由ソフトウェアとオープンソースは共通する部分も多いが
    出発点となる思想が異なるので、混同できない
 - GPL等、コピーレフトに基づくライセンスは
   自由ソフトウェア運動 に基づくもの
 - ライセンスを選ぶのに
 "商用利用可能かどうか"という視点はあまり有効ではない

---

# 参考文献


スライド「**自作プログラムにどのライセンスを付ける？ ~ライセンスの選択方法**」
NEC OSS推進センター・姉崎章博 2021/8/28 (OSC2021 Online)
https://jpn.nec.com/oss/osslc/doc/20210828_ODC.pdf

書籍「**フリーソフトウェアと自由な社会 ―Richard M. Stallmanエッセイ集**」
 リチャード・M・ストールマン (著)、長尾 高弘 (翻訳) 2003/5/6

書籍「**OSSライセンスの教科書**」
上田 理 (著), 岩井 久美子 (監修) 2018/8/23



---

# 参考文献

https://www.gnu.org
Gnuプロジェクト [公式]

https://opensource.org
Open Source Initiative [公式]

https://ja.wikipedia.org
https://en.wikipedia.org
Wikipedia (引用元が確認できる記事を参照)