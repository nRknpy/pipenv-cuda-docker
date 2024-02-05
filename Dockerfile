FROM nvidia/cuda:12.3.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PIPENV_VENV_IN_PROJECT=1
ENV PIPENV_YES 1

ENV HOME /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
    libffi-dev \
    libssl-dev \
    zlib1g-dev \
    liblzma-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libopencv-dev \
    tk-dev \
    python3-pip \
    wget \
    curl \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv && \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc && \
    eval "$(pyenv init --path)"

WORKDIR /app

RUN pip install --upgrade pip && \
    python3 -m pip install pipenv

COPY entrypoint.sh ./

ENTRYPOINT [ "/app/entrypoint.sh" ]