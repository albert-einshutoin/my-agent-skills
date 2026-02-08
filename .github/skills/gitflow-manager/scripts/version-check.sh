#!/bin/bash
# Check if versions in package.json and Cargo.toml match
NPM_VERSION=$(node -p "require('./package.json').version")
RUST_VERSION=$(grep '^version' Cargo.toml | head -1 | cut -d '"' -f 2)

if [ "$NPM_VERSION" != "$RUST_VERSION" ]; then
  echo "Error: Version mismatch! npm: $NPM_VERSION, Rust: $RUST_VERSION"
  exit 1
else
  echo "Versions match: $NPM_VERSION"
  exit 0
fi