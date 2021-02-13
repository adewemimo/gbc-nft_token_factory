const BirdieNFTs = artifacts.require('../contracts/BirdieNFTs');



var chai = require('chai');  
var chaiAsPromised = require("chai-as-promised");
chai.use(chaiAsPromised); // // Using Should style and chai as a promise.
var assert = chai.assert;    // Using Assert style
var expect = chai.expect;    // Using Expect style
var should = chai.should();  // Using Should style



contract('BirdieNFTs', (accounts) => {
    let contract;

    before(async () => {
        contract = await BirdieNFTs.deployed();

    })

    describe('deployment', async () => {


        it('deploys successfully', async () => {  
            const address = contract.address;
            console.log(address);
            assert.notEqual(address, '');
            assert.notEqual(address, 0x0);
            assert.notEqual(address, null);
            assert.notEqual(address, undefined);
        })

        it('has a name', async ()=> {
            const name = await contract.name();
            assert.equal(name, 'Birdies');
        })

        it('has a symbol', async ()=> {
            const symbol = await contract.symbol();
            assert.equal(symbol, 'BRDS');
        })

    })

    describe('minting', async () => {

        it('create a new token', async () => {
            const result = await contract.createBirdie('parrot', 'abc', 50);
            const totalSupply = await contract.totalSupply();
            //Success
            assert.equal(totalSupply,1);
            const event = result.logs[0].args;
            assert.equal(event.tokenId.toNumber(), 0, 'Id is correct');
            assert.equal(event.from, '0x0000000000000000000000000000000000000000', 'from is correct');
            assert.equal(event.to, accounts[0], 'to is correct');

            //Failure: cannot mint same birdie twice
            await contract.createBirdie('', '', 0).should.be.rejected;
        })
    })
})