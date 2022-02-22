const array = artifacts.require("Array");


module.exports = function(_deployer) {
  _deployer.deploy(array)
  // Use deployer to state migration tasks.
};
