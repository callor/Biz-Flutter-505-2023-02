import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_090_pomodors/pages/main_page.dart';

void main() {
  /**
   * main() => stateless => stateFull => state 이러한 경로를 중간 생략하는 경우
   * DataBinding 이 되는 경우
   * main() 함수에 App 초기화 하는 코드들이 있는경우는
   * 이 속성을 추가해 주는 것이 좋다
   */
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const setCounter = 5;
  int _counter = setCounter;
  bool _timeRun = false;
  late Timer _timer;

  void _onPressed() {
    setState(() => _timeRun = !_timeRun);
    if (_timeRun) {
      _timer = Timer.periodic(
        // Duration 으로 설정된 시간마다 callback 함수를 실행하라
        const Duration(seconds: 1),
        // callback 함수
        (timer) {
          setState(() {
            _counter--;
            if (_counter < 1) {
              _counter = setCounter;
              _timeRun = false;
              timer.cancel();
            }
          });
        },
      );
    } else {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("images/background.jpg"),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainPage(
                  counter: _counter,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: SizedBox(
            width: 100,
            height: 100,
            child: FloatingActionButton(
              backgroundColor: Colors.white38,
              elevation: 5,
              onPressed: _onPressed,
              tooltip: 'Start',
              child: Icon(
                (_timeRun ? Icons.pause : Icons.play_arrow),
                size: 50,
                color: Colors.black,
              ),
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
