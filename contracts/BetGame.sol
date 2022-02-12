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
    uint256 outcome;
    uint256 amount;
    bool initialized;
  }

  // keep track of every gambler's bet
  mapping (address => Bet) bets;
  // keep track of every player's winnings (if any)
  mapping (address => uint256) winnings;
  // keep track of all outcomes
  mapping (uint256 => uint256) public outcomes;

  // Add any events you think are necessary
  event BetMade(address gambler);
  event BetClosed();

  // modifier
  modifier ownerOnly() {_;}
  modifier oracleOnly() {_;}
  modifier outcomeExists(uint256 outcome) {_;}

  // Owner chooses their trusted Oracle
  function chooseOracle(address _oracle) external ownerOnly() returns (address) {
      oracle = _oracle;
      return oracle;
  }

  // Gamblers place their bets, preferably after calling checkOutcomes
  function makeBet(uint256 _outcome) external payable {
      Bet memory newBet = Bet(_outcome, msg.value, true);
      bets[msg.sender] = newBet;
  }

  // Allow anyone to check the outcomes they can bet on
  function checkOutcomes(uint outcome) public view returns (uint) {
      return outcomes[outcome];
  }
  
  // Allow anyone to check if they won any bets
  function checkWinnings() public view returns(uint) {
      return winnings[msg.sender];
  }

}