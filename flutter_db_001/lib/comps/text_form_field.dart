import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required TextEditingController inputController,
    required this.labelText,
  }) : _inputController = inputController;

  final TextEditingController _inputController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: _inputController,
        decoration: InputDecoration(labelText: labelText),
        style: const TextStyle(fontSize: 15, color: Colors.blue),
        validator: (value) {
          if (value!.isEmpty) {
            return "$labelText 을 입력해 주세요";
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.always,
        textInputAction: TextInputAction.go,
        onFieldSubmitted: (value) async {
          _inputController.text = value;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value)));
        },
      ),
    );
  }
}
