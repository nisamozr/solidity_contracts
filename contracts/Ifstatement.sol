// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Ifstatement {
  

  function foo(uint _num) pure public returns(uint){
    if(_num < 10){
      return 0;
    }else if(_num < 20){
      return 1;
    }else{
      return 2;
    }
  }

  function ternary(uint _num) pure public returns(uint){
    return _num < 10 ? 1 : 2 ;
  }
}
