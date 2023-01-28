#! /bin/bash

. .env
export ETH_RPC_URL
export PRIVATE_KEY
export CONTRACT

echo 'ETH_RPC_URL' $ETH_RPC_URL
echo 'PRIVATE_KEY' $PRIVATE_KEY
echo 'CONTRACT' $CONTRACT

echo 'Block number:' $(cast block-number)

#solc --abi --hashes --overwrite -o tmp contracts/filecoin-api-examples/Counter.sol

# d09de08a: increment()
# 8381f58a: number()
# 3fb5c1cb: setNumber(uint256)

set -x

cast call $CONTRACT "number()"

cast send --private-key $PRIVATE_KEY $CONTRACT "increment()"

sleep 30

cast call $CONTRACT "number()"

