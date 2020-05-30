const Faucet = artifacts.require("Faucet");

module.exports = (deployer) => {
  deployer.deploy(Faucet);
};
