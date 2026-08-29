// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract CrowdFund{
    mapping(address => uint) public contributers;
    address public owner;
    uint public minContri;
    uint public deadline;
    uint public target;
    uint public raisedAmount; //I feel like this is unncessary 
    uint public noOfContributer;

    constructor(uint _deadline, uint _target){
        owner = msg.sender;
        minContri = 100 wei;
        deadline = block.timestamp+ _deadline;
        target = _target; //Ye bhi sikh hi lo constructor me koi value
        // abhi nahi dena to usko aise declare kar ke baad me de sakte hai 
    }

    function sendEth() public payable {
        require(block.timestamp < deadline, "Daedline has passed");
        require(msg.value == minContri, "Please provide 100 wei");

        //this is block logic: If the user is new just increase the by 1
        if(contributers[msg.sender]==0){
            noOfContributer++;
        }

        //we can simply do msg.sender == msg.value, 
        //But if the user again sends the 100 wei it would not add up 
        //it would still remain 100 wei 
        contributers[msg.sender] += msg.value;
        raisedAmount +=msg.value;
    }

    function getContractBlance() public view returns(uint) {
        return address(this).balance;
    }
}