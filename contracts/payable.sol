// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract lec32 {
  event howMuch(uint256 _value);

  function sendNow(address payable _to) public payable {
    bool sent = _to.send(msg.value); // return true or false
    require(sent, "Failed to send either");
    emit howMuch(msg.value);
  }

  function transferNow(address payable _to) public payable {
    _to.transfer(msg.value);
    emit howMuch(msg.value);
  }

  function callNow(address payable _to) public payable {
    //0.50
    // (bool sent, ) = _to.call.gas(1000).value(msg.value)("");
    // require(sent,"Failed to send either");

    //0.7 ~
    (bool sent, ) = _to.call{ value: msg.value, gas: 1000 }("");
    require(sent, "Failed to send Ether");
    emit howMuch(msg.value);
  }
}

contract MobileBanking {
  address owner;

  constructor() payable {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Only Owner!");
    _;
  }

  event SendInfo(address _msgSender, uint256 _currentValue);
  event MyCurrentValue(address _msgSender, uint256 _value);
  event CurrentValueOfSomeone(address _msgSender, address _to, uint256 _value);

  function sendEther(address payable _to) public payable onlyOwner {
    require(msg.sender.balance >= msg.value, "Your balance is not enough");
    _to.transfer(msg.value);
    emit SendInfo(msg.sender, (msg.sender).balance);
  }

  function checkValueNow() public onlyOwner {
    emit MyCurrentValue(msg.sender, msg.sender.balance);
  }

  function checkUserMoney(address _to) public onlyOwner {
    emit CurrentValueOfSomeone(msg.sender, _to, _to.balance);
  }
}
