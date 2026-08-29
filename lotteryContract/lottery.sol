// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

//So in this contract we are going to be making a simple lottery contract 
// It is simple just by seeing the contract you can understand it 

contract Lottery {
    address public owner; //the one who can call the winner
    address payable[] public participants;
    //the list of array in which the players will be stores 
    // And the winner will be selected 

    //Now set the owner with the help of constructor 
    constructor() {
        owner = msg.sender;
    }

    //Now have to receive the eth players send 
    receive() external payable {
        //only by adding the receive the contract receive the eth 
        // And inside here we can add whatever logic we want, like update the array
        require(msg.value == 1 ether, "Ether value should be 1");
        require(participants.length < 3, "Can only 3 can take part");
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint) {
        require(msg.sender == owner, "Only owner can call this fxn");
        return address(this).balance;
    }

    //Now the proceess to select the winner 
    function random() public view returns(uint) {
        return uint (keccak256(abi.encodePacked(block.timestamp, block.difficulty, participants.length)));
    }
    //this is like a function to get a random num google it 

    //Now select the winner 
    function selectWinner() public {
        require(msg.sender == owner, "Not the owner");
        require(participants.length == 3, "Not enough player");
        uint r = random();
        uint index = r % participants.length;
        address payable winner;
        winner = participants[index];
        winner.transfer(getBalance());
        participants = new address payable[](0);
    }

}

//And we are done