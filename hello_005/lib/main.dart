import 'package:flutter/material.dart';

/*
 * main()
 * flutter 의 진입점 함수
 * 가장먼저 실행되는 함수 
 * main() 함수의 runApp() 함수를 통하여
 * 화면을 구현하는 class 를 호출하기
 */
void main() {
  runApp(const App());
}

/*
 * flutter 에서 화면을 구현하는 
 * 모든 도구를 Widget 이라고 한다
 * 컴포넌트(화면을 구현하는 도구) 
 * 
 * StateLessWidget
 * 정적인 화면을 구현하는 Widget
 * 데이터의 변화가 없거나 그냥 보여만 주는 화면을 구현
 * 
 * StatelessWidget 을 상속받아 App 이라는 클래스를 생성하겠다
 * 상속받은 클래스에서는 build() 함수를(메서드) 재 정의하여
 * 다른 Widget 을 화면에 보여주도록 한다
 */
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * flutter 로 만들어지는 화면을 가장 바깥쪽 box 에
     * MaterialApp() 컨테이너 Widget으로 시작해야 한다
     * MaterialApp 의 home 변수에 이후의 다른 Widget 을 포함한다
     * 
     * MaterialApp 의 theme 를 적용하기 위하여
     * Scaffold() widget 으로 child 를 감싸준다
     * 
     */
    return MaterialApp(
        title: "Hello",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

/*
 * StatefullWidget
 * 변화되는 데이터, 변화되는 변수 등을
 * 화면에 표현하기 위한 클래스
 * 이 클래스는 반드시 State<변수> 클래스를 동반한다
 * StatefullWidget 은 데이터나 변수가 변화되는 것을 감시하고
 * State 클래스에게 통보하는 역할을 수행한다 
 */
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

/* 
 * State 클래스는 변화는 데이터, 변수 값을 화면에 그리는 역할
 * State 클래스에서 선언하는 모든 변수는 
 * 변수 자체가 State 성질을 갖는다
 * 
 * 클래스, 변수, 함수 이름 앞에 underBar(_) 를 붙이면
 * 모든 접근자가 private 이 된다
 * 즉 다른곳에서는 접근할 수없고 현재 scope 내에서만 접근
 * 가능하도록 만드는 것
 */
class _HomePageState extends State<HomePage> {
  int _counter = 0;
  void _counterUp() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _counterUp,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("My Flutter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("반갑습니다"),
            Text(
              "카운터 : $_counter",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            const Text("우리나라만세"),
            const Text("Korea"),
            const Text("Hello Korea"),
            const Text(
              "Republic of Korea",
              style: TextStyle(
                fontSize: 30,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
