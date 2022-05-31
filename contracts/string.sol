// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Function {
  string public kyleName = "Park";
  uint256 public kyleAge = 3;

  function changeValue(string memory _name, uint256 _age)
    public
    returns (uint256)
  {
    kyleName = _name;
    kyleAge = _age;

    return kyleAge;
  }
}
