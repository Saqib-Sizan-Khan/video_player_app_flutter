import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player_app_flutter/widgets/action_container.dart';
import 'package:video_player_app_flutter/widgets/text_widget.dart';

class PlayVideoScreen extends StatelessWidget {
  const PlayVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            height: 211.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("assets/images/test.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: TextWidget(
                      text:
                          "আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান",
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                TextWidget(
                    text: '53,245 views  .  3 days ago',
                    textColor: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionCon(
                        width: 110.w,
                        height: 56.h,
                        icon: "assets/images/love.png",
                        title: "Mash Allah (12K)"),
                    ActionCon(
                        width: 80.w,
                        height: 56.h,
                        icon: "assets/images/like.png",
                        title: "LIKE (12K)"),
                    ActionCon(
                        width: 60.w,
                        height: 56.h,
                        icon: "assets/images/share.png",
                        title: "SHARE"),
                    ActionCon(
                        width: 65.w,
                        height: 56.h,
                        icon: "assets/images/report.png",
                        title: "REPORT"),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                          backgroundImage:
                              NetworkImage('assets/images/test3.png'),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: 'Mega Bangla Tv',
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            TextWidget(
                                text: '3M Subscribers',
                                textColor: Colors.grey,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 109.w,
                      height: 33.h,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Row(
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 16),
                          SizedBox(width: 8),
                          TextWidget(
                              text: 'Subscribe',
                              textColor: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 32),

          Row(
            children: [
              TextWidget(text: 'Comments  7.5K', textColor: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
              Icon(Icons.send)
            ],
          )
        ],
      ),
    );
  }
}
