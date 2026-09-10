//With the learning version i would like add another contract that performs the smae task 
//And it's logic is like one contract per crowd funding contract 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract test {
   address public owner;
   string reason;
   address payable recipentAddress;
   uint deadline;
   uint target;
   bool funded;
   mapping (address => uint) public voters;

   constructor(address payable _recipientsAddress, uint _deadline, uint _target, string memory _reason) {
      owner = msg.sender;
      reason = _reason;
      recipentAddress = payable(_recipientsAddress);
      deadline = block.timestamp + _deadline;
      target = _target;
   }

   function sendEth() payable public {
      require(block.timestamp < deadline);
      voters[msg.sender] += msg.value;
   }

   function getRefund() payable public {
      require(voters[msg.sender] > 0);
      require(block.timestamp > deadline);
      address payable user;
      user = payable(msg.sender);
      user.transfer(voters[msg.sender]);
      voters[msg.sender] = 0;
   }

   function getFunding() public {
      require(block.timestamp < deadline);
      require(target <= address(this).balance);
      require(!funded);
      recipentAddress.transfer(address(this).balance);
      funded = true;
   }

}