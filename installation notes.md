apt-get install -y \
python3-pip git \
libtinfo-dev \
libzmq3-dev \
libcairo2-dev \
libpango1.0-dev \
libmagic-dev \
libblas-dev \
liblapack-dev

cd /tmp && curl -sSL https://get.haskellstack.org/ | sh ; cd -
PATH="$HOME"/.local/bin:"$PATH"

mkdir -p "$HOME"/git && cd "$HOME"/git
git clone --depth 1 https://github.com/gibiansky/IHaskell.git && cd "$HOME"/IHaskell

pip3 install -r requirements.txt

stack setup
stack install gtk2hs-buildtools
stack install --fast
# Install Tensorflow bindings & it's deps (https://github.com/tensorflow/haskell)
stack install tensorflow tensorflow-proto tensorflow-records tensorflow-test tensorflow-opgen tensorflow-ops tensorflow-logging tensorflow-core-ops tensorflow-records-conduit snappy snappy-framing 

stack exec ihaskell -- install --stack

<!-- stack exec jupyter -- notebook -->
stack exec jupyter -- notebook --ip=172.17.0.2 --allow-root

---
<!-- Tensorflow -->
mkdir -p "$HOME"/tensorflow
apt-get install -y libcupti-dev

<!-- Using virtualenv -->
apt-get install -y python3-pip python3-dev python-virtualenv
virtualenv --system-site-packages -p python3 "$HOME"/tensorflow
source "$HOME"/tensorflow/bin/activate

<!-- Using CPU -->
pip3 install --upgrade tensorflow

---
# This section is not needed
<!-- Install Tensorflow Haskell bindings -->
cd ~/git && git clone --depth 1 --recursive https://github.com/tensorflow/haskell.git tensorflow-haskell

<!-- porting ./docker/Dockerbuild -->
apt-get install -y \
    # Required by snappy-frames dependency.
    libsnappy-dev \
    # Avoids /usr/bin/ld: cannot find -ltinfo
    libncurses5-dev \
    # Makes stack viable in the container
    libgmp-dev \
    # Required for locales configuration.
    locales

# Our MNIST demo program outputs Unicode characters.
dpkg-reconfigure locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8
    
# Installs protoc and the libraries.
apt-get install unzip
curl -O -L https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip && \
    unzip -d /usr/local protoc-3.2.0-linux-x86_64.zip bin/protoc && \
    chmod 755 /usr/local/bin/protoc && \
    curl -O https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-1.0.0.tar.gz && \
    tar zxf libtensorflow-cpu-linux-x86_64-1.0.0.tar.gz -C /usr/local && \
    ldconfig

LANG=en_US.UTF-8

cd ~/git/tensorflow-haskell
stack setup
stack test

---
