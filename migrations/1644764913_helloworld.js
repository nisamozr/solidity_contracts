const Hello = artifacts.require("Helloworld");

module.exports = function(_deployer) {
  _deployer.deploy(Hello);
  // Use deployer to state migration tasks.
};
