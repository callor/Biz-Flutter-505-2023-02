import 'package:flutter/material.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "잔액",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        Text("￦ 234,500,200",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w800,
              color: Colors.white.withOpacity(0.8),
            )),
      ],
    );
  }
}
