import 'package:flutter/material.dart';
import 'package:flutter_110_mvvm/ui_models/counter_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // viewModel 클래스를 provier 로 등록하는 절차
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // viewModel 가져오기
    // var viewModel = context.watch<CounterViewModel>();

    var increment =
        context.select<CounterViewModel, Function()>((v) => v.increment);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hello"),
            Text(
              context
                  .select<CounterViewModel, int>((v) => v.counter)
                  .toString(), //  viewModel.counter.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: increment,
              child: const Text(
                "증가",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )),
      ),
    );
  }
}
