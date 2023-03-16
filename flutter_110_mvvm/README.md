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

## flutter provider 를 사용한 MVVM 패턴

- 기본적으로 `StateFull`, `State` 클래스가 없어도 된다
- `StateLess` 클래스만으로 프로젝트가 가능해 진다.
- flutter 에서 권장하는 기본 class diagram은 'main()' -> 'StateLess' -> 'StateFull` -> 'State' 구조이다.
- 일부 개발자는 중간의 `StateLess`를 생략해 버리는 경우도 있다. 하지만 퍼포먼스적인 문제에서 모든 클래스를 `StateFull`과 `State`구로로만 만드는 것은 비효율적이고 메모리 누수가 발생할 확율이 높아진다고 한다. 별로 권장하지는 않는다.
- provider 를 활용한 MVVM 패턴의 구조는 모든 곳에서 `StateFull`과 `State` 를 사용하지 않아도 된다.

## MVVM 패턴의 구조 만들기

- `ChangeNotifier` 클래스를 Mixin 한 viewModel 클래스 만들기

## 클래스의 Mixin

- ChangeNotifier 클래스를 Mixin 한다
- extends 는 상속을 받는 것, 상위(부모) 클래스의 모든것을 물려 받는것
- Mixin 은 약간의 개념이 달라서, CounterViewModel 클래스와 ChangeNotifer 클래스를 합성하여 새로운 클래스를 만드는 개념
- extends 는 기본적으로 한개의 클래스만을 상속받을 수 있다.
  하지만 Mixin 은 여러개의 클래스를 복합하여 구조를 만들 수 있다.

## mixin 의 장점(예)

- `고양이 클래스`와 `운동하기 클래스`가 있다고 하자
- 이 두개의 클래스를 상속받아 `고양이가 운동하기 클래스`를 만들고 싶을때 `extends(상속)`의 개념으로는 불가능하다.
- 이때 mixin 개념을 사용하면 위의 예와 같은 다수의 클래스를 복합하여 새로운 클래스를 만들어 낼수 있다.

## provider 등록하기

- 여러개의 provider 등록하기
- ChangeNotifier 클래스를 mixin 한 클래스를 등록한다

```dart
  runApp(MultiProvider(
    providers: [
      // viewModel 클래스를 provier 로 등록하는 절차
      ChangeNotifierProvider(
        create: (_) => CounterViewModel(),
      )
    ],
  ));
```

- 한개의 provider 만 등록할때

```dart
  runApp(
    // viewModel 클래스를 provier 로 등록하는 절차
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
    ),
  );
```

## viewModel 클래스를 만들고 ChangeNofierProvider 에 등록하는 이유

- ChangeMofierProvider 에 viewModel 클래스를 등록하면 App의 `context` 에 viewModel 클래스의 객체가 등록된다.
- `context.watch<ViewModel>()`, `context.read<ViewModel>()`,  
  `context.select<ViewModel>()` 를 사용하여 viewModel 을 어디에서든지 가져다 사용할수 있다.
- 단, 이때는 Widget 의 `build()` method 내에서만 가능하다.
- `provider` 구형 모델에서는 `Provider.of<ViewModel>(context, listen:false)` 와  
  `Select<ViewModel>(context)` 같은 함수를 사용하였다.

## viewModel 를 참조하는 함수

### context.watch<ViewModel>(), context.read<ViewModel>()

- ViewModel 클래스를 객체로 생성하여 참조할수 있도록 만드는 함수
- 아래와 같은 코드로 사용할수 있다

```dart
var viewModel = context.watch<ViewModel>();
Text(viewModel.속성변수);  // 화면에 그릴 수 있다
viewModel.맴버함수();

var readOnlyViewModel = context.read<ViewModel>();
Text(readOnlyViewModel.속성변수); // 화면에 한번만 그릴수 있다
readOnlyViewModel.맴버함수();
```

- `context.watch` 는 화면에 rendering 을 일으키는 viewModel 이다
- `context.read` 는 화면에 rendering 을 일으키지 않는 이벤트 함수용이다

## context.select<ViewModel,int>( callback )

- viewModel 의 요소들을 개별적으로 추출
- `context.watch`나 `context.read`는 viewModel 클래스에 담긴 모든 변수, 함수를 통째로 가져와서 사용할 준비를 한다.
- `context.select`는 개별적인 요소들을 별도로 추출하여 메모리 낭비를 줄일 수 있다.

```dart
var counter = context.select<CounterViewModel, int>(v=>v.counter); // 변수
var increment = context.select<CounterViewModel, Function()>(v=>v.increment); // 함수
```
