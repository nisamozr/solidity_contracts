const Ifstatement = artifacts.require("Ifstatement");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Ifstatement", function (/* accounts */) {
  it("should assert true", async function () {
    await Ifstatement.deployed();
    return assert.isTrue(true);
  });
  it("if num < 10 ", async()=>{
    const contract = await Ifstatement.deployed();
    const set = await contract.foo(5)
    assert.equal(set, 0)
  })
  it("if num < 20 ", async()=>{
    const contract = await Ifstatement.deployed();
    const set = await contract.foo(15)
    assert.equal(set, 1)
  })
  it("if num > 20 ", async()=>{
    const contract = await Ifstatement.deployed();
    const set = await contract.foo(25)
    assert.equal(set, 2)
  })
  it("ternary num < 10 ", async()=>{
    const contract = await Ifstatement.deployed();
    const set = await contract.ternary(5)
    assert.equal(set, 1)
  })
  it("ternary num > 10 ", async()=>{
    const contract = await Ifstatement.deployed();
    const set = await contract.ternary(5)
    assert.equal(set, 1)
  })

});
