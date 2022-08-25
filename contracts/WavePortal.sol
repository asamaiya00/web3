// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";


contract WavePortal {
    uint256 totalWaves;
    
    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    Wave[] waves;

    constructor() {
        console.log("Test smart contract");
    }

    function wave(string memory _msg) public {
        totalWaves += 1;
        console.log("%s has waved! w message %s", msg.sender, _msg);

        waves.push(Wave(msg.sender, _msg, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _msg);

    }
    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}