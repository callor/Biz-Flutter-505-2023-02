import "package:flutter/material.dart";

import "../comps/text_form_field.dart";
import "../models/dog_dto.dart";

class DogInput extends StatelessWidget {
  const DogInput({super.key});

  @override
  Widget build(BuildContext context) {
    const pageTitle = "애견 정보 입력";
    return Scaffold(
      appBar: AppBar(
        title: const Text(pageTitle),
      ),
      body: const DogInputForm(),
    );
  }
}

class DogInputForm extends StatefulWidget {
  const DogInputForm({super.key});
  @override
  State<DogInputForm> createState() => _DogInputState();
}

class _DogInputState extends State<DogInputForm> {
  // input box(TextForField) 의 reference 를 지정하기위한 도구
  final _nameInputController = TextEditingController();
  final _ageInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Center(
            child: Column(
          children: [
            CTextFormField(
              inputController: _nameInputController,
              labelText: "이름",
            ),
            CTextFormField(
              inputController: _ageInputController,
              labelText: "나이",
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("데이터를 확인해 주세요")));
                  } else {
                    String name = _nameInputController.text;
                    String age = _ageInputController.text;

                    // JS의 td.closest("TR")
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("$name, $age 확인")));
                    Dog dog = Dog(name: name, age: int.parse(age));
                    Navigator.pop(context, dog);
                  }
                },
                child: const Text("저장"),
              ),
            )
          ],
        )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameInputController.dispose();
    _ageInputController.dispose();
  }
}
