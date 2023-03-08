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
        home: Scaffold(
          body: Stack(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                    height: 1000,
                    width: 1000,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: const Image(
                      fit: BoxFit.fill,
                      image: AssetImage("images/image_6.jpg"),
                    )),
              ),
              const Center(
                  child: Text(
                "첫번째",
                style: TextStyle(
                  fontSize: 100,
                  color: Colors.white,
                ),
              )),
              const Center(
                child: Text(
                  "두번째",
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "세번째",
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
