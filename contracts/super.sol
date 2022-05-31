// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Father {
  event FatherName(string name);

  function who() public virtual {
    emit FatherName("Odin");
  }
}

contract Mother {
  event MotherName(string name);

  function who() public virtual {
    emit MotherName("Frigga");
  }
}

contract Son is Father, Mother {
  event sonName(string name);

  function who() public override(Father, Mother) {
    super.who();
    emit sonName("Thor");
  }
}
