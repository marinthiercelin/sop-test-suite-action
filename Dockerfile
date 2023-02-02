FROM rust

RUN apt update && apt install -y git rustc cargo clang llvm pkg-config nettle-dev

RUN git clone https://gitlab.com/sequoia-pgp/openpgp-interoperability-test-suite.git

WORKDIR openpgp-interoperability-test-suite

RUN cargo build

RUN mkdir results

ENTRYPOINT [ "./run_test_suite.sh" ]
