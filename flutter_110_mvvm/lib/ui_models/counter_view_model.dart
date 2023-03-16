// ChangeNotifier 클래스를 mixin를 한다.
// mixin 키워드가 dart 에서는 width 를 사용한다
// ChangeNotifier 클래스를 mixin 한 클래스는 viewModel 클래스가 된다.
import 'package:flutter/material.dart';

class CounterViewModel with ChangeNotifier {
  // private 접근제한을 갖는 int 형 변수 선언하고 get또는 set 를 선언한다
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;

    // 어딘선가 counter 변수를 화면에 그리고 있으면
    // counter 변수 값이 변경되었음을 공지하는 함수
    notifyListeners(); // State 클래스의 setState() 함수 역할을 수행행
  }
}
