#! /bin/bash

. .env
export ETH_RPC_URL
export PRIVATE_KEY
export CONTRACT

echo 'ETH_RPC_URL' $ETH_RPC_URL
echo 'PRIVATE_KEY' $PRIVATE_KEY
echo 'CONTRACT' $CONTRACT

echo 'Block number:' $(cast block-number)

# 7ac7fef4: encodePacked(uint64)

set -x

cast call $CONTRACT "encodePacked(uint64)" 1000


