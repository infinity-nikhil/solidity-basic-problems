//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//GOAL: In basic one what we have done is pushed those who paid the payement via recive
// in an array 
// In this one we are gonna map those who will send the money 
// The mapping should be something like address -> value they send 

contract Test {
    uint public owner;
    mapping(address => uint256) public balances;

    receive() external payable {
        balances[msg.sender] = msg.value;
    }
}