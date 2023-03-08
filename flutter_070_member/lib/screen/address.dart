import 'package:flutter/material.dart';
import 'package:kpostal/kpostal.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPagePageState();
}

class _AddressPagePageState extends State<AddressPage> {
  String postCode = "";
  String address = "";
  String latitude = "";
  String longtude = "";

  String kkLatitude = "";
  String kkLongtude = "";

  // Map<String, String>? resultData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: kPostView(context));
  }

  KpostalView kPostView(BuildContext context) {
    return KpostalView(
      // kakaoKey: 카카오 개발자 key,
      useLocalServer: true,
      localPort: 1024,
      callback: (result) async {
        final Map<String, String> resultData = {
          'postCode': result.postCode,
          'address': result.address,
          'latitude': result.latitude.toString(),
          'longtude': result.longitude.toString(),
          'kkLatitude': result.kakaoLatitude.toString(),
          'kkLongtude': result.kakaoLongitude.toString(),
        };
        print("ResultData ${resultData.toString()}");
        Navigator.pop(context, resultData);
      },
    );
  }
}
