// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract V2NFTContract is ERC721URIStorage, Ownable {
    uint256 public nextTokenId;
    string public baseURI;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseURI,
        address _owner
    ) ERC721(_name, _symbol) {
        baseURI = _baseURI;
        transferOwnership(_owner);
    }

    function mint(address to, string memory tokenURI_) external onlyOwner {
        uint256 tokenId = nextTokenId;
        nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI_);
    }

    function setBaseURI(string memory _baseURI) external onlyOwner {
        baseURI = _baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}
