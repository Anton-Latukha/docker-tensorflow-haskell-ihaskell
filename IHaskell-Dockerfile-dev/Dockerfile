FROM latukha/ubuntu-dev-updated
MAINTAINER Anton Latukha <anton.latukha+docker@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
# IHaskell deps
RUN apt-get install -y \
        python3-pip git \
        libtinfo-dev \
        libzmq3-dev \
        libcairo2-dev \
        libpango1.0-dev \
        libmagic-dev \
        libblas-dev \
        liblapack-dev
# Stack
RUN cd /tmp && curl -sSL https://get.haskellstack.org/ | sh ; cd -
RUN PATH="$HOME"/.local/bin:"$PATH"
RUN mkdir -p "$HOME"/git && cd "$HOME"/git
# IHaskell
RUN git clone --depth 1 https://github.com/gibiansky/IHaskell.git && cd "$HOME"/IHaskell
RUN pip3 install -r requirements.txt
RUN stack setup
RUN stack install gtk2hs-buildtools
RUN stack install --fast
## Activate IHaskell Stack
RUN stack exec ihaskell -- install --stack
# Run Jupyter server
CMD stack exec jupyter -- notebook --ip="$(hostname -i)" --allow-root
