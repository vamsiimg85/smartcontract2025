// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathLib {
    function add(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }

    function mul(uint a, uint b) internal pure returns (uint) {
        return a * b;
    }
}

contract Calculator {
    using MathLib for uint;

    function calcAdd(uint x, uint y) public pure returns (uint) {
        return x.add(y); // same as MathLib.add(x, y)
    }

    function calcMul(uint x, uint y) public pure returns (uint) {
        return x.mul(y);
    }
}