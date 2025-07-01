// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

// Creating a contract 
contract Types { 

    // Declaring state variables
    uint public i = 10;       // Made public so you can view it in Remix
    string public result;     // Same for result

    // Function to demonstrate if-else-if-else logic
    function decision_making() public returns (string memory) {
        if (i < 10) {
            result = "less than 10";
        } else if (i == 10) {
            result = "equal to 10";
        } else {
            result = "greater than 10";
        }
        return result;
    }

    // Optional: Set a new value for i
    function setI(uint _i) public {
        i = _i;
    }
}
