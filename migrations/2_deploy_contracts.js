const SafeMath = artifacts.require("SafeMath");
const ERC721 = artifacts.require("ERC721");
const AnimalsTown = artifacts.require("AnimalsTown")
const WhitelistedRole = artifacts.require("WhitelistedRole")


const name = "AnimauxCoin"
const ticker = "AC"
const totalSupply = 10**30;
const decimals = 8;
const rate = 4;


module.exports = function(deployer) {
  deployer.deploy(SafeMath);
  deployer.deploy(ERC721)
  deployer.deploy(AnimalsTown);
  deployer.deploy(WhitelistedRole);
};
