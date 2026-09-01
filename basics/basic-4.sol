//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Now make a receive thing but in the mapping it should be like the
// 1-> 0x000hjsbbfva 2->0x00dnjwjne kind of number wise mapping 


contract Test{
    mapping (uint256=>address) public balances;
    uint public num;

    receive() external payable {
        balances[num] = msg.sender;  // here donot do [num] == msg.sender
        num++;
    }
}

//That is it .... ]