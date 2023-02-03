FROM ubuntu

# Build test suite

RUN apt update && apt install -y git rustc cargo clang llvm pkg-config nettle-dev

ENV TEST_SUITE_DIR=/openpgp-interoperability-test-suite

ENV TEST_SUITE_REPO=https://gitlab.com/sequoia-pgp/openpgp-interoperability-test-suite.git

RUN git clone ${TEST_SUITE_REPO} ${TEST_SUITE_DIR}

WORKDIR ${TEST_SUITE_DIR}

RUN cargo build

ENV TEST_SUITE=${TEST_SUITE_DIR}/target/debug/openpgp-interoperability-test-suite

# Set up running configuration

ENV SCRIPTS_DIR=/scripts

RUN mkdir ${SCRIPTS_DIR}

COPY run_test_suite.sh ${SCRIPTS_DIR}/run_test_suite.sh

# Run test suite

WORKDIR /

ENTRYPOINT [ "/scripts/run_test_suite.sh" ]