// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BirdieSpeciesNFTs is ERC721 {
    uint idCounter;

    struct Birdie {
        uint256 id;
        string birdieName;
        string birdieImage;
        uint256 price;
        address owner;
        
    }
    Birdie[] public birdies;
   


    constructor(string memory _birdieSpeciesName, string memory _symbol) ERC721(_birdieSpeciesName, _symbol) public {
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

contract BirdieNFTFactory {
    struct BirdieNFTContract {
        BirdieSpeciesNFTs _birdieSpecies;
        address creator;
        string symbol;
        string name;
    }


    BirdieNFTContract[] public BirdieNFTContracts; 
    uint public BirdieNFTContractCount;

    event tokenCreated(address indexed contractAddress, string tokenName, string TokenSymbol);

    function createToken(string memory _birdieSpeciesName_, string memory _symbol_) public {
        BirdieSpeciesNFTs _birdieSpecies = new BirdieSpeciesNFTs(_birdieSpeciesName_, _symbol_);
        BirdieNFTContract memory newBirdieNFTContract;

        newBirdieNFTContract._birdieSpecies = _birdieSpecies;
        newBirdieNFTContract.creator = msg.sender;
        newBirdieNFTContract.name = _birdieSpeciesName_;
        newBirdieNFTContract.symbol = _symbol_;

        BirdieNFTContracts.push(newBirdieNFTContract);
        BirdieNFTContractCount++;
        emit tokenCreated(address(_birdieSpecies),_birdieSpeciesName_, _symbol_ );

    }
        
}