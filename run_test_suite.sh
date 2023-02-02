#!/bin/bash
CONFIG_PATH=$1
cp CONFIG_PATH config.json
cargo run -- --html-out results/results.html
