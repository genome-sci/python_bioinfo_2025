# 2. NumPy　（担当：国立遺伝学研究所　黒川真臣）

## NumPyとは何か

<p align="center">
  <img src="https://github.com/numpy/numpy/blob/main/branding/logo/logomark/numpylogoicon.png?raw=true" alt="NumPy Logo" width="150" />
</p>

### 実用的側面
NumPyは、**メモリ効率の良い配列計算を高速に実行できるPythonパッケージ**です。
この性質により、NumPyは多くのPythonパッケージの計算基盤を担っています。そのため、Pythonで数値計算を扱う場合にはNumPyの理解が重要です。

### 実体的側面
NumPyは、**配列計算に特化した `ndarray` クラスと、それを操作する多数の関数群から構成されるPythonパッケージ**です。
`ndarray` はN次元配列を扱うためのクラスであり、ベクトル（1次元）や行列（2次元）に数学的演算を適用することができます。
NumPyの多くの間数はC言語で実装されており、それがNumPyの速さの鍵となっています。

## 内容
本単元は以下の内容を扱います。
1. 配列の生成
2. 配列の次元
3. 配列の操作
4. データの型
5. view

## 参考資料
本単元の資料は以下の資料を参考にして作成しました。
- [改訂版 独習Pythonバイオ情報解析（羊土社）](https://www.yodosha.co.jp/yodobook/book/9784758122788/)
- [2024年度先進ゲノム支援、DDBJ合同 中級者情報解析講習会：1-3 NumPy（東 光一）](https://github.com/genome-sci/python_bioinfo_2024/tree/main/1-3)
- [NumPy公式ドキュメント](https://numpy.org/doc/stable/)