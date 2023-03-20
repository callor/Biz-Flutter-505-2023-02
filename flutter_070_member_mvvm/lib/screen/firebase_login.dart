import 'package:flutter/material.dart';

import '../comps/input_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    user,
    required Future<void> Function({
      required String email,
      required String password,
    })
        this.loginSubmit,
  });
  final Function loginSubmit;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _userEmail = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return loginForm();
  }

  // TextFormField inputBox(
  //     {keyboardType = TextInputType.text,
  //     String labelText = "값을 입력하세요",
  //     String errorMsg = "값을 입력하세요",
  //     bool obscureText = false,
  //     Function(dynamic value)? onChanged}) {
  //   return TextFormField(
  //     onChanged: onChanged,
  //     obscureText: obscureText,
  //     keyboardType: keyboardType,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return errorMsg;
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       border: const OutlineInputBorder(),
  //       labelText: labelText,
  //     ),
  //   );
  // }

  Form loginForm() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Image(
              width: 100,
              height: 100,
              image: AssetImage("images/user.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            inputBox(
              keyboardType: TextInputType.emailAddress,
              errorMsg: "이메일을 입력해 주세요",
              labelText: "이메일",
              onChanged: (value) {
                _userEmail = value;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 10,
            ),
            inputBox(
              keyboardType: TextInputType.text,
              errorMsg: "비밀번호를 입력하세요",
              labelText: "비밀번호",
              obscureText: true,
              onChanged: (value) {
                _password = value;
                setState(() {});
              },
            ),
            ElevatedButton(
              onPressed: () {
                widget.loginSubmit(
                  email: _userEmail,
                  password: _password,
                );
              },
              child: const Text("이메일 로그인하기"),
            )
          ],
        ),
      ),
    );
  }
}
