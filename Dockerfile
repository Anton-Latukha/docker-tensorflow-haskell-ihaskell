FROM latukha/ubuntu-dev-updated
MAINTAINER Anton Latukha <anton.latukha+docker@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
# IHaskell deps
RUN apt-get update
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
WORKDIR "$HOME"/git
# IHaskell
RUN git clone --depth 1 https://github.com/gibiansky/IHaskell.git
WORKDIR "$HOME"/git/IHaskell
RUN pip3 install -r requirements.txt
RUN stack setup
RUN stack install gtk2hs-buildtools
RUN stack install --fast

# Tensorflow
RUN apt-get install -y libcupti-dev

## Using virtualenv
RUN apt-get install -y python3-pip python3-dev python-virtualenv
RUN virtualenv --system-site-packages -p python3 "$HOME"/tensorflow
WORKDIR "$HOME"/tensorflow
RUN /bin/bash -c 'source "$HOME"/tensorflow/bin/activate'

## Using CPU
RUN /bin/bash -c 'pip3 install --upgrade tensorflow'

## Install Tensorflow bindings & it's deps (https://github.com/tensorflow/haskell)
WORKDIR "$HOME"/git/IHaskell
RUN apt-get install -y \
    # Required by snappy-frames dependency.
    libsnappy-dev \
    # Avoids /usr/bin/ld: cannot find -ltinfo
    libncurses5-dev \
    # Makes stack viable in the container
    libgmp-dev \
    # Required for locales configuration.
    locales
RUN stack install snappy snappy-framing tensorflow tensorflow-proto tensorflow-records tensorflow-test tensorflow-opgen tensorflow-ops tensorflow-logging tensorflow-core-ops tensorflow-records-conduit

## Activate IHaskell Stack
RUN stack exec ihaskell -- install --stack

# Run Jupyter server
EXPOSE 8888
WORKDIR "$HOME"/git
CMD stack exec jupyter -- notebook --ip="$(hostname -i)" --allow-root
