# 2025年度先進ゲノム支援(PAGS)、DDBJ合同 中級者情報解析講習会

## 概要
- 日時：  
  2026年2月20日（金）10：00 ～ 16:00（予定）
- 会場：  
    オンライン開催(Zoom webinar)

## スケジュール：
【2020年2月20日】  
- 10：05～10：30　[1. Jupyter notebook の使い方 遺伝研　谷沢靖洋](https://github.com/genome-sci/python_bioinfo_2025/tree/main/1)
- 10：30～11：00　[2. Numpy　遺伝研　黒川真臣](https://github.com/genome-sci/python_bioinfo_2025/tree/main/2)
- 11：00～12：00　[3. 表形式ファイルの処理（Pandas）　遺伝研　坂本美佳](https://github.com/genome-sci/python_bioinfo_2025/tree/main/3)
- 13：00〜14：30　[4. Pythonを用いた基礎的なシングルセルRNA-seq解析　遺伝研　望月孝子](https://github.com/genome-sci/python_bioinfo_2025/tree/main/5)
- 14：40〜15：40　[5. 生成AIを用いたプログラミング等　遺伝研　森宙史](https://github.com/genome-sci/python_bioinfo_2025/tree/main/6)



## プログラム実行環境の準備
本講習会では Linux/Mac 環境で miniforge (mamba) を使って必要なライブラリをインストールして実行することを想定しています。  
Windows をご使用の場合、WSL2 を使った Linux 環境か Linux の仮想マシンで実行環境を用意してください。

### miniforge 仮想環境へのインストール
miniforge は[公式ウェブサイト](https://github.com/conda-forge/miniforge)の手順等に従ってインストールしてください。miniforge のかわりに Anaconda、miniconda、micromamba 等を使っても構いません。

- 仮想環境の作成
`pags2025` という名称で仮想環境を作成し、Python 3.12 をインストールします。Anaconda/miniconda を使用している場合には `mamba` コマンドの代わりに `conda` コマンドを使用してください。
```
mamba create -n pags2025 python=3.12
# 仮想環境の有効化
mamba activate pags2025
```
仮想環境から抜けるには `mamba deactivate` を実行します。

- モジュールのインストール
仮想環境 `pags2025` を有効化した状態で行なってください。
```
mamba install -c conda-forge jupyter
mamba install -c bioconda biopython
mamba install -c conda-forge matplotlib-venn
mamba install -c conda-forge scanpy python-igraph leidenalg
mamba install -c conda-forge scikit-misc
```

- Jupyter notebookの起動
```
# ソースコード取得
git clone https://github.com/genome-sci/python_bioinfo_2025.git

# ディレクトリに移動
cd python_bioinfo_2025

# jupyter notebook起動
jupyter notebook
```
起動すると自動でWebブラウザが立ち上がります。
Webブラウザが立ち上がらない場合には、http://localhost:8888/ にアクセスしてください。

### Docker を利用する場合
```
# ソースコード取得
git clone https://github.com/genome-sci/python_bioinfo_2025.git

# ディレクトリに移動
cd python_bioinfo_2025

# コンテナイメージをビルド (pags:2025という名称のイメージを作成します)
docker build -t pags:2025 .

# jupyter notebook 起動
docker run -it --rm -v $PWD:/python_bioinfo_2025 -p 8888:8888 pags:2025

# コンテナ内でコマンドを実行する
docker run -it --rm -v $PWD:/python_bioinfo_2025 -p 8888:8888 pags:2025 bash
```

Jupyter notebook を開くには起動後、ウェブブラウザから http://localhost:8888 を開いてください。
