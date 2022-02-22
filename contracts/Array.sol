// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Array {
 uint[] public arr;
 uint[] public arr2 = [1,2,3];
 uint[10] public fixedArray;

function get(uint i) public view returns(uint){
  return arr[i];
}
function add(uint i) public {
  arr.push(i);
}

function popArray() public{
  arr.pop();
}
function remove(uint i) public {
  delete arr[i];
}
function getLength() public view returns(uint){
  return arr.length;
}

function getArray() public view returns(uint[] memory){
  return arr;
}
function removeCompact(uint i) public{
arr[i] = arr[arr.length-1];
arr.pop();
}

}
