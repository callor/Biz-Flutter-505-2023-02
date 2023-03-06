import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("여기는 홈"),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/image"),
            child: const Text("이미지 보기"),
          )
        ],
      ),
    ));
  }
}
