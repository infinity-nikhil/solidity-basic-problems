// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//in this one we will try to learn something known as nested mapping
// let me draw the how it should look 

// mapping(address) => mapping (
//     address ---> address ---> uint 
// )

contract NestedMappings {
    // Mapping from address => (mapping from uint to bool)
    mapping(address => mapping(uint => bool)) public nestedMap;

    function get(address _addr1, uint _i) public returns (bool) {
        // You can get values from a nested mapping
        // even when it is not initialized
        // The default value for a bool type is false
        return nestedMap[_addr1][_i] = true;  
    }
    //it's simple addres points towards a number, number points to a boolean
}