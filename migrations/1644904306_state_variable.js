const state = artifacts.require("StateVariable");

module.exports = function(_deployer) {
  _deployer.deploy(state);
  // Use deployer to state migration tasks.
};
