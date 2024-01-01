import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player_app_flutter/widgets/text_widget.dart';

class ActionCon extends StatelessWidget {
  const ActionCon(
      {super.key,
      required this.width,
      required this.icon,
      required this.title});

  final double width;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 65.h,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5))),
      child: Column(
        children: [
          Image.asset(icon, scale: 1.2),
          TextWidget(
              text: title,
              textColor: Colors.grey.shade500,
              fontSize: 12.spMin,
              fontWeight: FontWeight.w600)
        ],
      ),
    );
  }
}
