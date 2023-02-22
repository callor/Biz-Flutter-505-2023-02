import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  /**
   * const App() 
   * App class 를 객체로 생성하는 코드
   * App class 의 생성자 함수를 호출하는 코드
   */
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  /*
   * StatelessWidget 클래스를 상속받는 클래스(App)는
   * 반드시 build() 함수를 재 정의(implement) 해야 한다.
   */
  @override
  Widget build(BuildContext context) {
    /**
     * MaterialApp materialApp = new MaterialApp();
     *   --materialApp 의 속성들 설정하는 코드
     * return materialApp ;
     * 
     * MaterialApp materialApp = new MaterialApp(속성들 주입);
     * return materialApp;
     * 
     */
    const String title = "My Flutter";
    const String appBarTitle = "오늘의 Flutter";

    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomeScreen(
        appTitle: appBarTitle,
      ), // 화면에 보여줄 클래스 속성 주입
    );
  }
}

/*
 * required 키워드
 * 함수, 생성자 매개변수를 설정할때 변수 앞에 붙이는 키워드
 * 함수, 생성자를 호출할때 반드시 전달(주입)해야 하는 변수임을 명시 
 */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.appTitle});

  final String appTitle;

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.appTitle)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "안녕하세요\n우리 나라",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text.rich(TextSpan(
                text: "나의 Flutter\n",
                children: <TextSpan>[
                  TextSpan(
                    text: "대한민국\n",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(text: "Republic of Korea\n"),
                  TextSpan(
                    text: '우리나라만세',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}
