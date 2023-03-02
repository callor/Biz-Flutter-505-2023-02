import 'package:flutter/material.dart';
import 'package:todo_list/dao/todo_dao.dart';
import 'package:todo_list/screen/todo_list_view.dart';

import 'models/todo_dto.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoHomePage(title: 'Hello TodoList'),
    );
  }
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key, required this.title});

  // TodoHomePage() 생성자에 title 변수 값으로 전달된 문자열이
  // 자동 setting 된다.
  final String title;

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: AssetImage("images/image_1.jpg"),
          height: 100,
          width: 100,
        ),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: IconButton(
              onPressed: () {
                // ignore: avoid_print
                todoInputBox(context);
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
        child: FutureBuilder(
            future: TodoDao().selectAll(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return TodoListView(todoList: snapShot);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<dynamic> todoInputBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  decoration: const InputDecoration(hintText: "할일 입력"),
                  onChanged: (value) {
                    setState(() {
                      content = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, "INSERT");
                    },
                    child: const Text("추가하기"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "취소",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          );
        }).then((result) {
      if (result == "INSERT") {
        TodoDto todo = TodoDto(
          sdate: "2023-03-02",
          stime: "15:50:00",
          content: content,
        );
        TodoDao().insert(todo);
        setState(() {});
      }
    });
  }
}
