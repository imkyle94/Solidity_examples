// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Father {
  string public familyName = "Kim";
  string public givenName = "Jung";
  uint256 public money = 100;

  constructor(string memory _givenName) public {
    givenName = _givenName;
  }

  function getFamilyName() public view returns (string memory) {
    return familyName;
  }

  function getGivenName() public view returns (string memory) {
    return givenName;
  }

  function getMoney() public view virtual returns (uint256) {
    return money;
  }
}

contract Son is Father("James") {
  uint256 public earning = 0;

  function work() public {
    earning += 100;
  }

  function getMoney() public view override returns (uint256) {
    return money + earning;
  }
}
