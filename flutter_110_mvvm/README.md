# flutter_110_mvvm

- flutter 를 이용한 MVVM 패턴 연습
- flutter 에서는 선언형 프로그래밍을 한다.
- state 라는 개념을 사용하여 변수가 변동이 되면 변동된 변수에 대해 화면이 rendering 되는 구조의 프로그래밍을 한다.
- 이때, state 라는 변수의 값을 변경하고, 화면을 rendering 하기 위하여 `Statefull` 라는 클래와 `State`라는 클래스를 상속받은 구조의 Widget 을 만들고 이 위젯에 state 변수를 표현하는 부분을 포함하고, 어디선가 `setState()` 함수를 실행하면, 변화가 있는 state 변수를 자동감지하여 화면을 다시 rendering 하는 구조이다.
- flutter 에서 선언형 프로그래밍을 하기 위해서는 `StateFull`과 `state` 클래스가 반드시 필요하다.
- 이러한 구조는 명령형 프로그래밍과 선언형 프로그래밍의 구분을 다소 혼란스럽게 하는 구조가 된다.
- flutter 에서는 선언형 MVVM 패턴을 구현하기 위하여 BLoc(Business Logic Comps) 라는 패턴을 도입하여 MVVM을 구현하는 방법을 제안했다. 기존의 프로젝트를 BLoc 로 구현하는데는 상당히 많은 코드의 Refactoring 이 필요하고 개념적인 학습이 많이 필요하다
- 3rd party 그룹에서 Provider 라는 Dependency를 2019년에 발표하고, flutter에서 공식적으로 인증을 하여, 최근에는 Provider 를 사용하는 MVVM 패턴의 코드를 작성한다
- `flutter pub add provider`를 설치한다.
