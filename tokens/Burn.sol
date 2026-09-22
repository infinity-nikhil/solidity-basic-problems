// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, ERC20Burnable, Ownable {
    constructor(address initalOwner)
        ERC20("MyToken", "MTK")
        Ownable(initalOwner) {
            _mint(initalOwner, 1_000_000 *10 ** decimal());
        }

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
        }
}

// ERC20Burnable is an extension contract that adds two public functions: 
// burn(uint256 amount) (destroy your own tokens) and burnFrom(address account, uint256 amount) 
// (destroy someone else's tokens, if they've approved you).