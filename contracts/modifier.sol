// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Modifier {
  modifier onlyAdults() {
    revert("You are not allowed to pay for the cigarette");
    _;
  }

  function BuyCigarette() public onlyAdults returns (string memory) {
    return "Your payment is scceeded";
  }
}
