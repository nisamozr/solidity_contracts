// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariable{
  uint public num;
  function readState() view public returns(uint){
    return num;
  }

  function set(uint _num) public {
    num = _num;
  }

}
