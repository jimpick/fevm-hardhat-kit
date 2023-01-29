#! /bin/bash

. .env
export ETH_RPC_URL
export PRIVATE_KEY
export CONTRACT

echo 'ETH_RPC_URL' $ETH_RPC_URL
echo 'PRIVATE_KEY' $PRIVATE_KEY
echo 'CONTRACT' $CONTRACT

echo 'Block number:' $(cast block-number)

#solc --base-path '.' --include-path 'contracts/lib' --abi --hashes --overwrite -o tmp contracts/filecoin-api-examples/Counter.sol

#2eea1f77: getOwnerForMiner(bytes)
#d09de08a: increment()
#8381f58a: number()
#3fb5c1cb: setNumber(uint256)

set -x

#cast call $CONTRACT "getOwnerForMiner(bytes)" 0x000000000000000000000000ff000000000000000000000000000000000003e8
#cast call $CONTRACT "getOwnerForMiner(bytes)" 0x0003e8
cast send --private-key $PRIVATE_KEY --gas-limit 100000000 $CONTRACT "getOwnerForMiner(bytes)" 0x03e8

#cast send --private-key $PRIVATE_KEY $CONTRACT "getOwnerForMiner(bytes)" 0x00e807

