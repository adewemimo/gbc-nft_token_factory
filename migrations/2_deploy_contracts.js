const BirdieNFTs = artifacts.require('BirdieNFTs');

module.exports = function (deployer) {
  deployer.deploy(BirdieNFTs);
};
