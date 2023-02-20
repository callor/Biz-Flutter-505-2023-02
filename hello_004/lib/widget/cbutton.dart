import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;

  const CButton({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 23,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
