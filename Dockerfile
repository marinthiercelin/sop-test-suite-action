FROM rust

RUN apt update && apt install -y git rustc cargo clang llvm pkg-config nettle-dev

RUN git clone https://gitlab.com/sequoia-pgp/openpgp-interoperability-test-suite.git

WORKDIR openpgp-interoperability-test-suite

RUN cargo build 

ARG CONFIG=config.json
ARG SOP_DIR=sop_dir

COPY ${CONFIG} config.json

COPY ${SOP_DIR} sop_dir

COPY run_test_suite.sh run_test_suite.sh

RUN mkdir results

ENTRYPOINT [ "./run_test_suite.sh" ]
