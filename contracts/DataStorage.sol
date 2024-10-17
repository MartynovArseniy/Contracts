// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    mapping(uint256 => string) private dataStore;
    uint256 private dataCount;

    // Write data
    function writeData(string memory data) public {
        dataStore[dataCount] = data;
        dataCount++;
    }

    // Update data
    function updateData(uint256 id, string memory newData) public {
        require(id < dataCount, "Data not found");
        dataStore[id] = newData;
    }

    // Get data
    function getData(uint256 id) public view returns (string memory) {
        require(id < dataCount, "Data not found");
        return dataStore[id];
    }

    // Delete data
    function deleteData(uint256 id) public {
        require(id < dataCount, "Data not found");
        delete dataStore[id];
    }
}

