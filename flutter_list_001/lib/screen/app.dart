import 'package:flutter/material.dart';
import 'package:flutter_list_001/screen/list_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // useMaterial3: true,
        ),
        home: const ItemListView());
  }
}
