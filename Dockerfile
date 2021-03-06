FROM rust

RUN apt-get update && \
    apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 git

RUN git clone https://github.com/pemistahl/grex /tmp/grex

WORKDIR /tmp/grex

RUN git checkout tags/$(git describe --tags $(git rev-list --tags --max-count=1))

RUN RUSTFLAGS='-C link-arg=-s' cargo build --release

