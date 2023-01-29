// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { MinerAPI } from "../lib/filecoin-solidity/contracts/v0.8/MinerAPI.sol";
import { MinerTypes } from "../lib/filecoin-solidity/contracts/v0.8/types/MinerTypes.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function getOwnerForMiner(bytes memory target) public returns (MinerTypes.GetOwnerReturn memory) {
        MinerTypes.GetOwnerReturn memory ownerRet = MinerAPI.getOwner(target);
        return ownerRet;
    }

    function echoBytes(bytes memory target) public pure returns (bytes memory) {
        return target;
    }
}