// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Betting {
  // constructor function, where owner is set
  constructor() {
    owner = msg.sender;
  }

  // standard state variables
  address public owner;
  address public gamblerA;
  address public gamblerB;
  address public oracle;

  // structs are custom data structures with self-defined parameters
  struct Bet {
    uint outcome;
    uint amount;
    bool initialized;
  }

}