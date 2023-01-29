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

#9a34832d: echoBytes(bytes)
#2eea1f77: getOwnerForMiner(bytes)
#d09de08a: increment()
#8381f58a: number()
#3fb5c1cb: setNumber(uint256)

set -x

cast call $CONTRACT "echoBytes(bytes)" 0xdeadbeef


