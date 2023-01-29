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

# 6d1da431: minerCount()

set -x

#cast call $CONTRACT "getOwnerForMiner(bytes)" 0x000000000000000000000000ff000000000000000000000000000000000003e8
#cast call $CONTRACT "getOwnerForMiner(bytes)" 0x0003e8

cast send --private-key $PRIVATE_KEY --gas-limit 100000000 $CONTRACT "minerCount()"

