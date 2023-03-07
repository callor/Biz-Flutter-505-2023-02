import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kpostal API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kpostal API'),
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
  String postCode = "";
  String address = "";
  String latitude = "";
  String longtude = "";

  String kkLatitude = "";
  String kkLongtude = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              searchAddress(context),
              viewAddress(),
            ],
          ),
        ));
  }

  Container viewAddress() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(children: [
        Text("우편번호 : $postCode",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text("주소 : $address",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text("위도 : $latitude",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text("경도 : $longtude",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text("카카오 맵 위도 : $kkLatitude",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
        Text("카카오 맵 경도 : $kkLongtude",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ]),
    );
  }

  TextButton searchAddress(BuildContext context) {
    return TextButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => KpostalView(
                // kakaoKey: 카카오 개발자 key,
                useLocalServer: true,
                localPort: 1024,
                callback: (result) {
                  postCode = result.postCode;
                  address = result.address;
                  latitude = result.latitude.toString();
                  longtude = result.longitude.toString();
                  kkLatitude = result.kakaoLatitude.toString();
                  kkLongtude = result.kakaoLongitude.toString();
                  setState(() {});
                },
              ),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: const Text(
          "주소 찾기",
          style: TextStyle(color: Colors.white),
        ));
  }
}
