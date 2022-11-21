FROM ubuntu:rolling

RUN apt update

# install gcc, openssl, git, cmake, clang
RUN apt install gcc build-essential libssl-dev pkg-config git cmake clang libclang-dev -y

# install curl
RUN apt install curl -y

# install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN source "$HOME/.cargo/env"

# install Sui testnet client
RUN cargo install --locked --git https://github.com/MystenLabs/sui.git --branch testnet sui
