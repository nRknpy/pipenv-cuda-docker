# pipenv-cuda-docker

Docker コンテナ内で CUDA と pipenv を使用するための雛型．

## 動作環境

- [NVIDIA Driver](https://www.nvidia.co.jp/Download/index.aspx)
- [CUDA Toolkit](https://developer.nvidia.com/cuda-downloads) (>=12.3)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

## 環境構築

### clone

```sh
$ git clone https://github.com/nRknpy/pipenv-cuda-docker.git <ディレクトリ名>
$ cd <ディレクトリ名>
$ rm -rf .git
```

### 仮想環境で使用する Python のバージョンを指定

docker-compose.yml を書き換える．

```
services:
app:
    build:
    args:
        - PYTHON_VERSION=<python_version>
```

pyenv でインストールするので，リビジョンまで必要．

### コンテナを起動し，仮想環境に入る

```sh
$ docker compose up -d && docker compose exec app bash
```

コンテナに入った後，

```sh
$ pipenv shell
```

## For Windows

Git クライアントの改行コードを LF にしておく必要がある．

```sh
$ git config --global core.autocrlf input
```
