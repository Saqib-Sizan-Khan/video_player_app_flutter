import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.w700});

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color textColor;

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
