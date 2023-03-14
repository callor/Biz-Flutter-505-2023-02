import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_090_pomodors/pages/dash_board_page.dart';
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
  int _pageIndex = 0;
  static const setCounter = 5;
  int _counter = setCounter;
  bool _timeRun = false;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

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
          body: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            // page가 전환되었을때 bottomNav 에 표시하기 위해서
            onPageChanged: (pageNum) => {
              setState(() => _pageIndex = pageNum),
            },
            children: [
              MainPage(
                counter: _counter,
                onPressed: _onPressed,
                timeRun: _timeRun,
              ),
              const DashBoardPage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _pageIndex,
            onTap: (value) => {
              setState(
                () => {
                  _pageIndex = value,
                  _pageController.animateToPage(
                    value, // 몇번페이지 보일까
                    duration: const Duration(seconds: 1), // 페이지 전환시간
                    curve: Curves.ease, // 애니메이션 종류
                  )
                },
              )
            },
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Dash Board",
                icon: Icon(Icons.dashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
