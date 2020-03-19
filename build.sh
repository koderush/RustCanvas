#!/bin/bash

set -euo pipefail

TARGET=wasm32-unknown-unknown
BINARY=target/$TARGET/release/rust_canvas.wasm

cargo build --target $TARGET --release
wasm-strip $BINARY
mkdir -p www/
wasm-opt -O $BINARY -o www/rust_canvas.wasm
ls -lh www/rust_canvas.wasm