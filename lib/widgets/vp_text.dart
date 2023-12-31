import 'package:flutter/material.dart';

class VPText extends StatelessWidget {
  VPText(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.fontWeight = FontWeight.w700});

  String text;
  double? fontSize;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight));
  }
}
