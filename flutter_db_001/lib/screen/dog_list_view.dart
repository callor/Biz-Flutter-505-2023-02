import 'package:flutter/material.dart';

import '../models/dog_dto.dart';
import '../persistence/dog_db_service.dart';

class DogListView extends StatelessWidget {
  const DogListView({super.key, required this.snapshot});
  final AsyncSnapshot<List<Dog>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (BuildContext context, int index) {
          Dog dog = snapshot.data![index];
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              DogDBService().delete(dog.id);
              // setState(() {});
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    child: Text(dog.name,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                        )),
                  ),
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "${dog.age}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
