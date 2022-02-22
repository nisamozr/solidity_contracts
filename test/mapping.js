const Mapping = artifacts.require("Mapping");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Mapping", function (accounts ) {
  it("should assert true", async function () {
    await Mapping.deployed();
    return assert.isTrue(true);
  });
  it("set mapp ", async()=>{
    const contract = await Mapping.deployed();
     await contract.set(accounts[0],2)
    const get = await contract.get(accounts[0])
    assert.equal(get, 2)
  })
  it("remove mapp ", async()=>{
    const contract = await Mapping.deployed();
    await contract.remove(accounts[0])
    const get = await contract.get(accounts[0])
    assert.equal(get, 0)
  })
  

});
