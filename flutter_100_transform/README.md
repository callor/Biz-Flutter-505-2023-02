# dart 의 이중점(double dot) 연산자

```dart
List<int> list = [];
list.add(1);
list.add(2);
list.add(3);
list.add(4);
list.add(5);

list.add(6)..add(7)..add(8)..add(9)..add(10)

```

## flutter 의 화면 좌표계

- flutter 의 화면은 기본적으로 3D 이다
- 안드로이드 스마트기기의 GPU 은 기본적으로 3D에 최적화 되어 있다
- `Matrix4` 는 3차원 좌표를 다른 형식의 좌표로 투영하때 사용하는 도구
