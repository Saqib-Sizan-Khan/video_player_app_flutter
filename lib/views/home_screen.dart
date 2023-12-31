import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player_app_flutter/widgets/vp_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VPText(text: 'Trending Videos'),
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 346.w,
                      height: 192.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("assets/images/test.png"),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 35,
                            height: 17,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                                child: VPText(
                                    text: '3:40',
                                    textColor: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20.spMax,
                            backgroundImage: NetworkImage("assets/images/test2.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 235.w,
                                child: VPText(
                                    text:
                                    "আরব নেতাদের যে ভুলে ফি*লি*স্তি*নের এই দুর্দাশা | আবু ত্বহা মুহাম্মদ আদনান",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 8.h),
                              VPText(
                                  text: '53,245 views  .  Feb 21,2021',
                                  textColor: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400)
                            ],
                          ),
                          const Icon(Icons.more_vert_outlined, color: Colors.grey)
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h)
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
