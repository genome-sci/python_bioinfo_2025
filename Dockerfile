# Use miniforge3:24.11.3-0 as the base image
# FROM --platform=linux/amd64 condaforge/miniforge3:24.11.3-0
FROM condaforge/miniforge3:24.11.3-0


# Create the conda environment with Python 3.11
RUN mamba create -n pags python=3.11

# Initialize conda in bash shell
# RUN, CMD, ENTRYPOINTが実行される際のshellを指定
# condaのpags環境内でbashを実行するようにしている (defaultでは ["/bin/bash", "-c"])
SHELL ["mamba", "run", "-n", "pags", "/bin/bash", "-c"]

# Install Jupyter and other specified packages
RUN mamba install -c conda-forge jupyter && \
    mamba install -c conda-forge matplotlib matplotlib-venn pandas seaborn && \
    mamba install -c bioconda biopython bcbio-gff

# Install libraries for sc-seq analysis, if necessary.
#RUN mamba install -c bioconda -c conda-forge scanpy python-igraph leidenalg scvi-tools scvelo cellrank scikit-misc
# RUN mamba install -c conda-forge scanpy python-igraph leidenalg && \
#     mamba install -c conda-forge scvi-tools && \
#     mamba install -c bioconda scvelo && \
#     mamba install -c conda-forge -c bioconda cellrank && \
#     mamba install -c conda-forge scikit-misc


# Make port 8888 available to the world outside this container
EXPOSE 8888

# Set the default environment to pags when executing commands in the container
# RUN echo "mamba activate pags" >> /root/.bashrc
RUN mamba init && echo "mamba activate pags" >> /root/.bashrc


# Add source code to the container
COPY ./ /python_bioinfo
# Set the working directory in the container
WORKDIR /python_bioinfo


# Run Jupyter Notebook when the container launches
CMD ["mamba", "run", "-n", "pags", "--no-capture-output", "jupyter", "notebook", "--notebook-dir=/python_bioinfo", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
# Equivalent as above, but using the shell.
# CMD jupyter notebook --notebook-dir=/python_bioinfo --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.token=''