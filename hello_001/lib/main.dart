import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "나의 Flutter",
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HelloMain(appTitle: "안녕하세요"),
    );
  }
}

class HelloMain extends StatefulWidget {
  const HelloMain({super.key, required this.appTitle});

  final String appTitle;

  @override
  State<HelloMain> createState() => _HelloMain();
}

// dart 에서 함수나 변수 이름 시작을 underscore(_) 로 하면
// 이 함수는 현재 파일(main.dart)에서만 접근 가능한
// private 로 설정된다
//
class _HelloMain extends State<HelloMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.appTitle)),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text("Hello"),
                Text("안녕하세요"),
                Text("${10 + 20}"),
                Text("Republic of Korea"),
              ]),
        ));
  }
}
