import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // static const num = 100;
  int _counter = 1500; // 기본이 null null 허용변수
  bool _timerRun = false;
  late Timer _timer; // null 이 안되는 변수, 단 값 저장(초기화)를 나중에

  String formatTime(int seconds) {
    var duration = Duration(seconds: seconds);
    // print(duration);
    return duration.toString().split(".").first.substring(2);
  }

  void _onPressed() {
    setState(() {
      _timerRun = !_timerRun;
    });
    if (_timerRun) {
      _timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) => setState(() {
                _counter--;
              }));
    } else {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/pomodors.jpg"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                formatTime(_counter),
                style: TextStyle(
                  decorationColor: Colors.amber,
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.white,
                ),
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
            isExtended: true,
            elevation: 5,
            onPressed: _onPressed,
            tooltip: 'Increment',
            child: _timerRun
                ? const Icon(
                    Icons.pause,
                    size: 60,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.play_arrow,
                    size: 60,
                    color: Colors.black,
                  ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
