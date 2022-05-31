// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Event {
  event info(string name, uint256 money);

  function sendMoney() public {
    emit info("Odin", 1000);
  }
}

contract indexedEvent {
  event numberTracker(uint256 indexed num, string str);

  uint256 num = 0;

  function PushEvent(string memory _str) public {
    emit numberTracker(num, _str);
    num++;
  }
}
