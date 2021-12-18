// contracts/Must.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";

contract Nfty is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    bool private revealed = false;
    string private revealUrl = "";

    constructor() ERC721("NFTTY", "NFTTIES") {}

    function mintNFT(address collector, string memory _tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(collector, newItemId);
        _setTokenURI(newItemId, _tokenURI);

        return newItemId;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        if (revealed == true) {
            return super.tokenURI(tokenId);
        } else {
            return revealUrl;
        }
    }

    function revealCollection() public {
        revealed = true;
    }
}
