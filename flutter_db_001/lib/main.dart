import 'package:flutter/material.dart';
import 'package:flutter_db_001/persistence/dog_db_service.dart';
import 'package:flutter_db_001/screen/dog_input.dart';
import 'package:flutter_db_001/screen/dog_list_view.dart';

import 'models/dog_dto.dart';

void main() {
  // DB 연동을 할때는 반드시 추가해주기
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: "MY Dogs"),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

/*
 * DB 관련된 함수들의 return type 이 모두 Future type 이다
 * 함수들이 return 해준 데이터를 화면에 그리기 위해서는
 * FutreBuilder 라는 도구를 사용해서 그려야 한다 
 */
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: DogDBService().selectAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Dog>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: DogListView(snapshot: snapshot),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              // Dog dog = const Dog(name: "귀여미", age: 5);
              // Dog dog = DogDBService()
              //     .dogs[Random().nextInt(DogDBService().dogs.length)];
              // await DogDBService().insert(dog);
              // setState(() {});
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DogInput(),
                ),
              );
              await DogDBService().insert(result);
              setState(() {});
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
