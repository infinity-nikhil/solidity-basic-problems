// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    //declaring the variable 
    uint256 public number;

    //just allow the user to set the inital value 
    //You can remove it if you want, the number will start from 0 then 
    constructor(uint256 _value) {
        number = _value;
    }

    //now declaring the dynamic nuclear physics logic
    function Increment(uint256 _value) public returns(uint256) {
        number += _value;
        return number;
    }

    //Now same logic goes for the decrement 
    function decrement(uint256 _value) public returns(uint) {
        number -= _value;
        return number;
    }

    //Now the reset function 
    function reset() public returns(uint) {
        return number = 0;
    }
}

//Simple logic but i wrote the full code from strach now i wanna play arround with mapping