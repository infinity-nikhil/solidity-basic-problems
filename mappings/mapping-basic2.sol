// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    mapping(address=>uint) public balances;

    function initNum(uint _value) public {
        require(balances[msg.sender] == 0, "You already have a value" );
        balances[msg.sender] = _value;
    }

    function increment(uint _value) public {
        require(balances[msg.sender]>0, "You do not have a value");
        balances[msg.sender] += _value;
    }

    function decrement(uint _value) public {
        require(balances[msg.sender] >0, "You do not have a number");
        balances[msg.sender] -= _value;
    }

    function getNum() public view returns(uint) {
        require(balances[msg.sender] > 0, "You donot have auth");
        return balances[msg.sender];
    }
}

//Like it is the most basic counter program merged with mapping
//A lot of improvement and effiiceny is nedded but still roughly