// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MinerAPI} from "../lib/filecoin-solidity/contracts/v0.8/MinerAPI.sol";
import {MinerTypes} from "../lib/filecoin-solidity/contracts/v0.8/types/MinerTypes.sol";
import {PowerAPI} from "../lib/filecoin-solidity/contracts/v0.8/PowerAPI.sol";
import {PrecompilesAPI} from "../lib/filecoin-solidity/contracts/v0.8/PrecompilesAPI.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    event Owner(MinerTypes.GetOwnerReturn);

    function getOwnerForMiner(bytes memory target) public {
        MinerTypes.GetOwnerReturn memory ownerRet = MinerAPI.getOwner(target);
        emit Owner(ownerRet);
    }

    function echoBytes(bytes memory target) public pure returns (bytes memory) {
        return target;
    }

    function minerCount() public returns (uint64) {
        return PowerAPI.minerCount();
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }

    event ResolvedContractAddress(uint64);

    function getResolvedContractAddress() public {
        address contractAddress = address(this);
        uint64 resolved = PrecompilesAPI.resolveEthAddress(abi.encodePacked(contractAddress));
        emit ResolvedContractAddress(resolved);
    }

    function encodePacked(uint64 input) public pure returns (bytes memory) {
        return abi.encodePacked(input);
    }

    // https://github.com/celestiaorg/protobuf3-solidity-lib/blob/bc4e75a0bf6e365e820929eb293ef9b6d6d69678/contracts/ProtobufLib.sol#L646
    function encodeLEB128UInt(uint64 n) public pure returns (bytes memory) {
        // Count the number of groups of 7 bits
        // We need this pre-processing step since Solidity doesn't allow dynamic memory resizing
        uint64 tmp = n;
        uint64 num_bytes = 1;
        while (tmp > 0x7F) {
            tmp = tmp >> 7;
            num_bytes += 1;
        }

        bytes memory buf = new bytes(num_bytes);

        tmp = n;
        for (uint64 i = 0; i < num_bytes; i++) {
            // Set the first bit in the byte for each group of 7 bits
            buf[i] = bytes1(0x80 | uint8(tmp & 0x7F));
            tmp = tmp >> 7;
        }
        // Unset the first bit of the last byte
        buf[num_bytes - 1] &= 0x7F;

        return buf;
    }
}
