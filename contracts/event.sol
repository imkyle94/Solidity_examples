// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract lec13 {
    event info(string name, uint256 money);

    function sendMoney() public {
        emit info("KimDaeJin", 1000);
    }
}

contract Lec14 {
    event numberTracker(uint256 indexed num, string str);

    uint256 num = 0;

    function PushEvent(string memory _str) public {
        emit numberTracker(num, _str);
        num++;
    }
}
