// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Now let us explore some enums....enums are basically used to resticted the data types
//lets say you have a var named s_name and the var can only have "miah", "joe", "jhon"
//But what if the user sends "lawdane-bhujyam" ?
//to solve this we use enums...by using it we restrict the value of s_name saying it can 
//only have these fixed value and nothing else....
//

//Likke the typeof in ts

contract Enums {
    // How do we declare an enum ?
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    //Now the enum is decalred how do we use it ?
    // We make a var as usual and point it towards the enum saying hey look it's an enum type
    Status public status;
    //Now the status can't have any explicit values
    // Since enums are internally represented by uints
    // This function will always return a uint
    // Pending = 0
    // Shipped = 1
    // Accepted = 2
    // Rejected = 3
    // Canceled = 4
    // Value higher than 4 cannot be returned

    function set(Status _status) public {
        status = _status;
    }

    function get() public view returns (Status) {
        return status;
    }
    //Solidity enums themselves return their numeric index, not a string.
    // if status = Status.shipped internaly status = 1
    //if it only returns integer then what is it used for ? Answer is below
    function shipOrder() public {
    require(status == Status.Pending, "Order already processed");
    status = Status.Shipped;
    }

    //now the val of status is 1 if you try to access it 
    // Agar thodi insider baat batau to wo internally to index hi rahe ga but we can use as a state if we want 
    //as shown in the example above 

}