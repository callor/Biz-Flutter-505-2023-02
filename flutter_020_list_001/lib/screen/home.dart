import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter"),
        ),
        body: bodyContainer());
  }

  Container bodyContainer() {
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.blue,
      )),
      child: Column(
        children: [
          bodyText(
            text: "안녕하세요",
            fontSize: 30,
            fontColor: Colors.blue,
          ),
          bodyText(
            text: "Republic of Korea",
            fontColor: Colors.green,
            fontSize: 50,
          ),
          bodyText(text: "Korea"),
        ],
      ),
    );
  }

  Column bodyText({
    required String text,
    Color fontColor = Colors.black,
    double fontSize = 10,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(text,
            style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
            )),
      ],
    );
  }
}
