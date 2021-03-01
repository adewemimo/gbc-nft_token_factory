# NFT Token Factory
---
## Overview
The BirdieNFTs.sol is a smart contract that can be used to generate birdie tokens with the token name as **Birdies** and symbol as **BRDS**

However, this project is centered on creating a smart contract that allow for the creation of another smart contract that can be used to generate NFT tokens. The **BtirdieNFTFactory** allow the creation of such smart contracts.
## Run and Compile NTF Factory in truffle 
1.  run `truffle compile` to compile smart contract 
2.  run `ganache-cli` to connect ethereum client and have access to accounts for use when creating the smart contract.
3.  `truffle test` will run **BirdieNFTS.test.js** and provide the test result for BirdieNFTs.sol
4.  run both **BirdieNFTFactory.sol** and **BirdieNFT.sol** with `truffle develop`

## Using Remix to run a version of BirdieNFTFactory.sol 
1.   copy **BirdieSpeciesNFTSFactory.sol** in the remix folder to a Remix IDE
2.   run `ganache-cli` to connect ethereum client and have access to accounts for use when creating the smart contract.
3.   connect to ganache on remix IDE using `web3 provider`
4.   compile and deploy smart contract. select contract **BirdieNFTFactory** to deploy smart contract
5.   create and deploy any NFT Token smart contracts by providing the token name and symbol in **createToken** function.
6.   give a number (e.g. 0) to **BirdieNFTContracts** function to get the address to the created NFTToken smart contract
7.    check the functionality of an instance of the NFT smart contract created by **BirdieSpeciesNFTs** contract.
8.    Copy and paste the NFTToken Smart Contract address  to **At Address** to deploy and start creating tokens.


