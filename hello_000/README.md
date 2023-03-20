# hello_003

## Flutter lifeCycle

#### `initState()`

- 위젯이 생성될때 처음 호출, stateFull이 state 호출할때
- `BuildContext` 에 의존적인 데이터 초기화
- 동일 위젯트리내에서 속성 초기화

#### `didChangedDepdencies()`

- 위젯이 최소 생성될때 initState() 다음애 호출
- 위젯이 의존하는 데이터의 객체가 호출될때 마다
- 위젯이 업데이트 될때마다 네트워크 호출이 필요한 경우 등에서 사용

#### `build()`

- 매우 자주 호출
- 화면이 바뀔때마다(state 가 변경될때마다)
- `return Scaffold()` 등으로 Widget 을 return 해야 한다

#### `setState()`

- 개발자가 호출하고 싶을때
- state(변수)에 변화를 주고싶을때
- state에 따라 화면을 갱신 하고 싶을때

#### `dispose()`

- state 객체가 영구적으로 제거될때
- 더이상 build 되지 않는 화면
- Navigator 등을 사용하여 다른 화면을 호출할때 등
