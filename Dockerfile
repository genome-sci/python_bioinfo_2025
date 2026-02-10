# base container image
ARG BASE_IMAGE=condaforge/miniforge3:25.11.0-1
FROM ${BASE_IMAGE}

ARG PYTHON_VERSION=3.11
ARG WORKDIR=/python_bioinfo_2025

# 1. base環境のPythonバージョンを変更し、必要なパッケージをすべてインストール
# 仮想環境を作らないため -n オプションは不要。一気にインストールするのがイメージ削減のコツです。
RUN mamba install -y python=${PYTHON_VERSION} 
RUN mamba install -y -c conda-forge jupyter matplotlib matplotlib-venn pandas seaborn && \
    mamba install -y -c bioconda biopython && \
    mamba clean -afy

# 必要ならばsc-seq解析用ライブラリをインストール
# RUN mamba install -c conda-forge scanpy python-igraph leidenalg && \
#     mamba install -c conda-forge scvi-tools && \
#     mamba install -c bioconda scvelo && \
#     mamba install -c conda-forge -c bioconda cellrank && \
#     mamba install -c conda-forge scikit-misc

# 2. ポート開放
EXPOSE 8888

# 3. ソースコードの追加と作業ディレクトリの設定
COPY ./ ${WORKDIR}
WORKDIR ${WORKDIR}

# 4. デフォルトでJupyter Notebookを起動するように設定
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]

# 追加: jn コマンドでJupyter Notebookを起動するエイリアスを設定
RUN echo "alias jn='jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token='" >> ~/.bashrc
