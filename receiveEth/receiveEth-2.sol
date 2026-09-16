//inscpite of using receive or fallback there is another way to deposite eth onto the contract 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getCost() payable public returns (address) {
        return msg.sender;
    }

}

//It also gives the balance to the contract along with executes some task 
//SO the question is 
//calldata = function + args So, is the value also the part of calldata hee cause in 
// receive the calldata and the value were 2 seperate things.....