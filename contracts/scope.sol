// Solidity program to implement 
// the variable scope 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VariableScopeExample {
  uint public publicVar = 1;
  uint private privateVar = 2;
  uint internal internalVar = 3;

  function getPrivateVar() public view returns (uint) 
  {
    return privateVar;
  }
}

contract DerivedContract is VariableScopeExample {
  function getInternalVar() public view returns (uint) 
  {
    return internalVar;
  }
}
