const Hello = artifacts.require("Helloworld");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Hello", function (/* accounts */) {
  it("should assert true", async function () {
    await Hello.deployed();
    return assert.isTrue(true);
  });
  it("string",async()=>{
    const contract = await Hello.deployed();
    const str = await contract.greet()
    assert.equal(str, "hello world")

  })
});
