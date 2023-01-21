// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage, Ownable{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenId;
    constructor() ERC721("My first NFT","SS"){}
    function mintNFT(address recepient, string memory tokenURI)public onlyOwner returns(uint){
        _tokenId.increment();
        uint newItemId = _tokenId.current();
        _mint(recepient, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }
}