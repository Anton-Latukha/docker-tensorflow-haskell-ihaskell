# docker-tensorflow-haskell-ihaskell
Image for convenient development with Tensorflow + Haskell/IHaskell

## Environment

Environment variables:
(required)
* `PASSWORD` - set password to connect to Jupyter Notebook
(optional)
* `PORT` - set port for jupyter inside container

## GPU

To use Tensorflow with GPU you need to install `nvidia-docker` (https://github.com/NVIDIA/nvidia-docker), and use GPU version of image.
