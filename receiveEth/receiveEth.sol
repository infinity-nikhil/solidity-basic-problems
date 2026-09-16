// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Ok so we already know that how can we receive eth in our contract 
//using recieve or fallback just decalre those with external payable and you are ready to go 
//But what if we don't and then try to send the eth ??

//yup tried that and got an error of :
//In order to receive Ether transfer the contract should have either 'receive' or payable 'fallback' function
contract Test {
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // fallback() external payable {}
}

//The question is fallback does it works properly but why are we getting an warning
//to also add a receive payble external {} ??
//While if you don't use fallback and use receive instead compiler doesn't give any warnings
//Why so beheviour in fall back then ??

//It is because fall back can handle the receive eth thing but it is not acutally is designed to do so it is designed to handle "Someone called something I don't recognize."
// meanswhile recieve is specially designed to handle the eth 


//So the compiler just says fallback can handle it but it is better if you add a receive 