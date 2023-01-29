#! /bin/bash

solc --base-path '.' --include-path 'contracts/lib' --abi --hashes --overwrite -o tmp contracts/filecoin-api-examples/Counter.sol

cat tmp/Counter.signatures
