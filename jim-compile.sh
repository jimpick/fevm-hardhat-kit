#! /bin/bash

solc --base-path '.' \
  --include-path 'node_modules' \
  --abi --hashes \
  --overwrite -o tmp \
  contracts/filecoin-api-examples/Counter.sol
  #--include-path 'contracts/lib' \

cat tmp/Counter.signatures
