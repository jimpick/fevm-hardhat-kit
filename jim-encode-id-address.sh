#! /bin/bash

. .env
export ETH_RPC_URL
export PRIVATE_KEY
export CONTRACT

echo 'ETH_RPC_URL' $ETH_RPC_URL
echo 'PRIVATE_KEY' $PRIVATE_KEY
echo 'CONTRACT' $CONTRACT

echo 'Block number:' $(cast block-number)

#4a9c36da: encodeIDAddress(uint64)


set -x

cast call $CONTRACT "encodeIDAddress(uint64)" 1000 2>&1 | tee ./tmp/encode.log

cast ad 'encodeIDAddress(uint64)(bytes memory)' $(cat ./tmp/encode.log)


