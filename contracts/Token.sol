// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Token {
  
  string public name = "AK Hardhat Token";
  string public symbol =  "AKHT";
  
  uint256 public totalSupply = 1000000;
  
  address public owner;

  mapping(address => uint256) balances;

  constructor () {
    balances[msg.sender] = totalSupply;
    owner = msg.sender;
  }

  function transfer(address to, uint256 amount)  external {
    
    console.log("Sender's balance is %s token", balances[msg.sender]);
    console.log("Trying send %s token to %s", amount, to);

    require(balances[msg.sender] >= amount, "Not enoguh tokens");

    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function balanceOf(address account) external view returns (uint256){
    return balances[account];
  }
}