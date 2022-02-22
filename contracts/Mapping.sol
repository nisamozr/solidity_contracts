// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Mapping {
  
  mapping (address => uint) public myMapping;

  function get(address adds)view public returns(uint){
    return myMapping[adds];
  }
  function set(address adds, uint num) public{
    myMapping[adds] = num;
  }
  function remove(address adds) public {
    delete myMapping[adds];
  }
}
