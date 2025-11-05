// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./V2NFTContract.sol";

contract V2NFTFactory {
    address[] public allCollections;
    event CollectionCreated(address indexed owner, address indexed collection);

    function createCollection(
        string memory name,
        string memory symbol,
        string memory baseURI
    ) external returns (address) {
        V2NFTContract collection = new V2NFTContract(name, symbol, baseURI, msg.sender);
        allCollections.push(address(collection));
        emit CollectionCreated(msg.sender, address(collection));
        return address(collection);
    }

    function getAllCollections() external view returns (address[] memory) {
        return allCollections;
    }
}
