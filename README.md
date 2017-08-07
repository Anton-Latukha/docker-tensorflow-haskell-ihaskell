# docker-tensorflow-haskell-ihaskell

Images for convenient development for Tensorflow + Haskell/IHaskell.

Has open source  versions:`gpu`, `cpu`. And advanced closed source versions: `adv-gpu`, `adv-cpu`.

Includes Jupyter notebooks, IHaskell environment, Haskell Tensorflow bindings and Tensorflow libraries.

We encourage to use GPU images wherever possible, so `latest` images defaults to GPU version.


## Quickstart - running GPU image

To use Tensorflow with GPU you need to:
1. Install `nvidia-docker` (https://github.com/NVIDIA/nvidia-docker)
2. Use GPU versions of images: `nvidia-docker run -e PASSWORD=<password> -p 8888:8888 <image_name>:<tag> `
3. Open `http://<host>:8888` URL
4. Enter password
5. Open IHaskell -> notebooks -> IHaskell.ipynb


## Quickstart - running CPU image

1. Use CPU versions of images: `docker run -e PASSWORD=<password> -p 8888:8888 <image_name>:<tag> `
2. Open `http://<host>:8888` URL
3. Enter password
4. Open IHaskell -> notebooks -> IHaskell.ipynb

## Environment

Environment variables:
### required
* `PASSWORD` - set password to connect to Jupyter Notebook. If password is not set, image going to configure URL token that is going to be posted to containers `STDOUT` at the end of starting process.

### optional
* `PORT` - set port for Jupyter inside container, but beware that Dockerfiles open 8888 by default configuration.


