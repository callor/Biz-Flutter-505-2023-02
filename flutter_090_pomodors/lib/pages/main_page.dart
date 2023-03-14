import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  /*
   * main.dart 에서 전달된 counter state 변수를
   * statefullWidget 이 감시를 하고 있다가
   * 값이 변화가 되면 Sate에게 통보하여 화면을 Rendering 하도록 한다
   * main.dart 에서 전달된 counter state 변수는
   * widget 클래스에 담아서 state 로 전달한다
   */
  const MainPage({super.key, required this.counter});
  final int counter;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _formatTime(seconds) {
    // Duration 클래스, 시, 분, 초 값을 전달받아서
    // 시:분:초 형식의 데이터로 변환시키는 클래스
    var duration = Duration(seconds: seconds);
    // return duration.toString().substring(2, 7);
    // :0:00:00

    print(duration);
    // split(구분자)
    // 구분자를 기준으로 문자열을 분해하고,
    // 배열(List)로 변환시키는 함수
    var times = duration.toString().split(".");
    // 생성된 문자열 List times 의 0 index 값을 추출하고 substring 으로
    // 분해하기
    if (times.length > 7) {
      return times.first.substring(3);
    } else {
      return times.first.substring(2);
    }

    // return "0:00";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          _formatTime(widget.counter),
          style: TextStyle(
              fontSize: 90,
              fontWeight: FontWeight.w900,
              // color: Colors.black,
              /**
             * var Paint pant = Paint()
             * paint.style(...)
             * paint.strokeWidth(3)
             * paint.color(Colors.amber)
             */
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3
                ..color = Colors.blueAccent),
        ),
        Text(
          _formatTime(widget.counter),
          style: const TextStyle(
            fontSize: 90,
            fontWeight: FontWeight.w900,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
