import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Firebase DB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late DatabaseReference _messageRef;

  final String _key = "Hello";
  final String _value = "Korea";

  bool initDB = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    // 현재 연결된 realtimeDB 에 "message" 라는 table 을 생성하기 위한
    // Ref id 를 생성하기
    _messageRef = FirebaseDatabase.instance.ref("message");
    initDB = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _incrementCounter() async {
    _counter++;
    await _messageRef.push().set(<String, String>{"name": "홍길동", "age": "22"});
    setState(() {});
  }

  Future<void> _deleteMessage(DataSnapshot data) async {
    final mRef = _messageRef.child(data.key!);
    await mRef.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        Flexible(
          child: FirebaseAnimatedList(
            query: _messageRef,
            itemBuilder: (context, snapshot, animation, index) {
              return ListTile(
                trailing: IconButton(
                  onPressed: () => _deleteMessage(snapshot),
                  icon: const Icon(
                    Icons.delete,
                  ),
                ),
                title: Text(
                  "$index: ${snapshot.value}",
                ),
              );
            },
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
