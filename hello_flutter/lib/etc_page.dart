import "package:flutter/material.dart";

class EtcPage extends StatefulWidget {
  const EtcPage({super.key});

  @override
  State<StatefulWidget> createState() => _EtcPage();
}

class _EtcPage extends State<EtcPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Image(image: AssetImage("images/image_1.jpg"))
          ]),
    );
  }
}
