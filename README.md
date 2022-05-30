# Solidity_examples
솔리디티 예제

### Data Type
1. string / byte
스트링 보다 바이트가 가스비가 더 적게 든다.

### 솔리디티 저장공간
solidity 는 storage, memory, calldata ,stack  이렇게 4개의 저장 영역으로  나뉘어 있다.
 
storage : 대부분의 변수, 함수들이 저장되며, 영속적으로 저장이되어 가스 비용이 비싸답니다.
 
memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장이 됩니다.
그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기에 storage보다 가스 비용이 싸답니다.
 
Colldata : 주로 external function 의 파라메터에서 사용 됩니다.
 
stack:  EVM (Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역인데 1024Mb 제한적입니다.

string을 쓰기위해서는 memory 일식적으로 저장하는 키워드를 써야한답니다. 

### Instance
클래스 혹은 컨트랙트를 사용한다면 반드시 알아야 하는 개념으로.
상속과 같은 개념이라 생각하면 편하다.
차이점이라면 메모리를 언급하면 될텐데,
사실 이러한 경우를 모두 통들어서도 변수를 가지고 뭘 하는 식은 지양해야할 듯 하다.
다시말해, 컨트랙트(클래스) 하나를 완전히 완성시킨 후에,
거기서 뭘 가져와 하려고한다면 인스턴스를 사용하면 좋을 듯 하다.


### Override
상속을 받은 후에 오버라이딩을 한다면, 쉽게 생각하면 백지가 된 상태라고 받아들이면 된다.
그래서, 오버라이딩 후에 다시 어떠한 것을 적어주는 작업을 해야하는데,
부모 컨트랙트의 내용을 가져오고 싶은 데 그 코드의 길이가 짧다면, 내가 직접 적어주면 되지만,
코드가 많거나 할 경우에 super()를 적어주면, 그대로 복붙이 된다.

### Send, Transfer, Call
1.send : 2300 gas를 소비, 성공여부를 true 또는 false로 리턴한다
    2.transfer : 2300 gas를 소비, 실패시 에러를 발생
    3.call : 가변적인 gas 소비 (gas값 지정 가능), 성공여부를 true 또는 false로 리턴
      재진입(reentrancy) 공격 위험성 있음, 2019년 12월 이후 call 사용을 추천. 

    
### Library
이점
1. 재사용 : 블록체인에 라이브러리가 배포되면, 다른 스마트 컨트랙들에 적용가능.
2. 가스 소비 줄임 : 라이브러리는 재사용가능 한 코드, 즉 여러개의 스마트 컨트랙에서 공통으로 쓰이는 코드를 따로 라이브러리 통해서 배포 하기에, 다른 스마트 컨트랙에 명시를 해주는것이 아니라, 라이브러리를 적용만 하면 되기에 가스 소비량을 줄일 수 있다. 왜냐하면, 가스는 스마트 컨트랙의 사이즈/길이에 영향을 많이 받기 때문이다. 
3.데이터 타입 적용: 라이브러리의 기능들은 데이터 타입에 적용할 수 있기에, 좀 더 쉽게 사용할 수 있다.
 
제한사항
1. fallback 함수 불가: fallback 함수를 라이브러리 안에 정의를 못 하기에, 이더를 갖고 있을 수 없습니다.
2. 상속 불가
3. payable 함수 정의 불가 
