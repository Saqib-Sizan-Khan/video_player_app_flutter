import 'package:flutter/material.dart';

class VPText extends StatelessWidget {
  VPText(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w700});

  String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 2,
        softWrap: true,
        style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis));
  }
}
