// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//This is like one of the easiest way via 
//example to understand mapping 

contract Counter {
    mapping(address=>uint) public balances;

    //you mapp address--> value(money they deposite)
    function deposit() public payable {
        balances[msg.sender] = msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}