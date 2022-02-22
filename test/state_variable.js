const state = artifacts.require("StateVariable");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("StateVariable", function (/* accounts */) {
  it("should assert true", async function () {
    await state.deployed();
    return assert.isTrue(true);
  });
  it("set state variable and read it", async()=>{
    const contract = await state.deployed();
    const set = await contract.set(5)
    const read = await contract.readState()
    assert.equal(5, read)

  })
});
