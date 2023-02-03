#!/bin/bash
set -x 

CONFIG_PATH=$1
RESULTS_PATH=$2

$TEST_SUITE --config $CONFIG_PATH --json-out $RESULTS_PATH
