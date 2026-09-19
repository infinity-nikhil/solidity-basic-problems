// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.6.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK"){}
}

// This is the most simple way to create an ERC-20 token of your

// The token has zero supply. The constructor never calls _mint, 
// so nobody holds any tokens and transfer will revert
//This just like haa ho gaya ban gaya bass token