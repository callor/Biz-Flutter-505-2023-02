import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text("이름 : 홍길동"),
        Text("나이 : 33"),
      ],
    );
  }
}
