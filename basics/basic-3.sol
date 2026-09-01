//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Now modify the basic-2 such that only 3 people can send the money 

contract Test {
    mapping(address => uint256) public balnaces;
    uint public participiants;

    receive() external payable{
        require(participiants<=3, "The list has been filled in");
        balnaces[msg.sender] += msg.value;
        participiants++;
    }
}

//And that is it....it works 