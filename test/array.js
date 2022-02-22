const Arrays = artifacts.require("Array");

/*
 * uncomment accounts to access the test accounts made available by the
 * Ethereum client
 * See docs: https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript
 */
contract("Array", function (/* accounts */) {
  it("should assert true", async function () {
    await Arrays.deployed();
    return assert.isTrue(true);
  });
  it("push array ", async()=>{
    const contract = await Arrays.deployed();
     await contract.add(15)
     await contract.add(20)
     await contract.add(25)
     const length = await contract.getLength()
     console.log("Length",length.toNumber())
  
    const get = await contract.get(0);
    assert.equal(get, 15)
  })
  it("pop array ", async()=>{
    const contract = await Arrays.deployed();
     await contract.popArray()
     const length = await contract.getLength()
     console.log("after pop ",length.toNumber())
    const get = await contract.get(1);
    assert.notEqual(get, 25)
  })
  it("delet array ", async()=>{
    const contract = await Arrays.deployed();
     await contract.remove(1)
     const length = await contract.getLength()
     console.log("after removing element from array ",length.toNumber())
    const get = await contract.get(1);
    assert.equal(get, 0)
  })
  it("remove with out gap ", async()=>{
    const contract = await Arrays.deployed();
    await contract.add(20)
    await contract.add(25)
   await contract.removeCompact(1)
     const length = await contract.getLength()
     console.log(length.toNumber())
    const get = await contract.get(1);
    assert.equal(get, 25)
  })

});
