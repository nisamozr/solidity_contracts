const mapping = artifacts.require("Mapping");
module.exports = function(_deployer) {
  // Use deployer to state migration tasks.
  _deployer.deploy(mapping)
};
