// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Father {
  uint256 public fatherMoney = 100;

  function getFatherName() public pure returns (string memory) {
    return "Odin";
  }

  function getMoney() public view virtual returns (uint256) {
    return fatherMoney;
  }
}

contract Mother {
  uint256 public motherMoney = 500;

  function getMotherName() public pure returns (string memory) {
    return "Frigga";
  }

  function getMoney() public view virtual returns (uint256) {
    return motherMoney;
  }
}

contract Son is Father, Mother {
  function getMoney() public view override(Father, Mother) returns (uint256) {
    return fatherMoney + motherMoney;
  }
}
