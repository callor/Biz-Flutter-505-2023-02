import 'package:flutter/material.dart';

import '../models/todo_dto.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key, required this.todoList});
  // List<TodoDto> 에 담길 데이터를 자동 동기화 시키기 위한
  // Wrapper class
  final AsyncSnapshot<List<TodoDto>> todoList;

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.todoList.data?.length,
        itemBuilder: (context, index) {
          // todoList 에서 index 번째 데이터를 getter 하여
          // todo 변수에 담기

          TodoDto todo = widget.todoList.data![index];
          return Dismissible(
              key: UniqueKey(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    width: 100,
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todo.sdate),
                        Text(todo.stime),
                      ],
                    ),
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.red,
                    //     width: 1,
                    //   ),
                    // ),
                    width: 300,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(todo.content,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                        )),
                  )
                ],
              ));
        });
  }
}
