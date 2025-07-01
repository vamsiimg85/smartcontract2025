// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Types {
    uint[] public data;
    uint8 public j = 0;

    event DataUpdated(uint[] updatedData);

    function loop() public returns (uint[] memory) {
        while (j < 5) {
            j++;
            data.push(j);
        }
        emit DataUpdated(data); // This will show in the Logs tab
        return data;
    }
}
