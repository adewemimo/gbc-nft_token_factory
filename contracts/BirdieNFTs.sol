// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract BirdieNFTs is ERC721 {
    uint idCounter;

    struct Birdie {
        uint256 id;
        string birdieName;
        string birdieImage;
        uint256 price;
        address payable owner;
        
    }
    Birdie[] public birdies;
    mapping(uint => bool)_birdieExits;

    constructor() ERC721('Birdies', 'BRDS') public {
    }

    function createBirdie(string memory _birdieName, string memory _birdieImage, uint256 _price) public {
        require(_price > 0 , 'The price cannot be zero');
        require(bytes(_birdieName).length > 0, 'The title cannot be empty');
        require(bytes(_birdieImage).length > 0, 'The image cannot be empty');

        Birdie memory _bird = Birdie ({
            id : idCounter,
            birdieName : _birdieName,
            birdieImage : _birdieImage,
            price : _price,
            owner : msg.sender
         });
        //create unique Id for the tokens
        birdies.push(_bird);
        uint256 _tokenId = birdies.length - 1;

        _safeMint(msg.sender, _tokenId);
        idCounter++;

    }
    

}

