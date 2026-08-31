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

    //Now here coding the what if the crowdfunding was a success....
    //And ye solidity me harr jagah dekhne ko milti hai .....
    //Struct -> mapping,..struct -> mapping and so on ...

    struct Request {
        string description;
        address payable recipients;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping (address=> bool) voters;
    }
    mapping (uint => Request) public requests;
    uint public numRequests;

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

    //Now lets code the refund logic 
    function getRefund() public {
        //first of all we have to perform some basic checks
        require(block.timestamp > deadline && raisedAmount < target, "The cantract is eligible to refund");
        //Now check weather the person if even has even done a contri or not 
        require(contributers[msg.sender] > 0); //sender ka balance more than 0 hona chahiye
        address payable user = payable(msg.sender);
        user.transfer(contributers[msg.sender]);
        contributers[msg.sender] = 0;
        //Nothing much complex logic it is just one block after another
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    function createRequests(string memory _description, address payable _recipient, uint _value) public  onlyOwner {
        Request storage newRequest = requests[numRequests];
        numRequests++;
        newRequest.description= _description;
        newRequest.recipients= _recipient;
        newRequest.value= _value;
        newRequest.completed= false;
        newRequest.noOfVoters=0;
    }

    function voteRequest(uint _requestNo) public {
        require(contributers[msg.sender]>0, "You must be a contributer");
        Request storage thisRequest = requests[_requestNo];
        require(thisRequest.voters[msg.sender] == false, "You have already voted");
        thisRequest.voters[msg.sender] =true;
        thisRequest.noOfVoters++;
    }

    function makePayment(uint _reqNum) public onlyOwner{
        require(raisedAmount>=target);
        Request storage thisRequest=requests[_reqNum];
        require(thisRequest.completed == false, "The re is completed");
        require(thisRequest.noOfVoters > noOfContributer / 2, "Majority doesnot suppolrt this shi");
        thisRequest.recipients.transfer(thisRequest.value);
        thisRequest.completed=true;
    }
}