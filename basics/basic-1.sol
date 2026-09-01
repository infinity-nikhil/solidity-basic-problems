// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Goal: build a public array which stores the address of the senders who sends payment via receive 

contract Test {
    address payable[] public payers;

    receive() external payable {
        payers.push(payable(msg.sender));
    }
}

// That is it;
