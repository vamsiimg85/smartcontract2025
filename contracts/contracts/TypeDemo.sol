// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ValueTypesDemo {
    // 1. uint: Unsigned integer (non-negative numbers)
    uint public count = 42; // Stores 0, 1, 2, etc. (default: uint256, 256 bits)

    // 2. int: Signed integer (positive or negative numbers)
    int public temperature = -10; // Stores -10, 0, 10, etc.

    // 3. string: Text data
    string public greeting = "Hello, Blockchain!"; // Stores text

    // 4. address: Ethereum address (wallet or contract)
    address public owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Example address

    // 5. bool: True or false
    bool public isActive = true; // Stores true or false

    // 6. bytes: Raw byte data (fixed or dynamic)
    bytes32 public hash = "abc123"; // Fixed-size 32-byte data

    // Function to update values
    function updateValues(uint _count, int _temp, string memory _greeting) public {
        count = _count;
        temperature = _temp;
        greeting = _greeting;
    }
}