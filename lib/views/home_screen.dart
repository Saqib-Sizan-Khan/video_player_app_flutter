import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app_flutter/model/video_model.dart';
import 'package:video_player_app_flutter/providers/video_provider.dart';
import 'package:video_player_app_flutter/views/video_play_screen.dart';
import 'package:video_player_app_flutter/widgets/text_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(text: 'Trending Videos'),
              SizedBox(height: 12.h),
              Consumer(builder: (context, watch, child) {
                AsyncValue<List<VideoModel>> videos = ref.watch(videoProvider);
                return videos.when(
                    data: (videoData) {
                      return Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: videoData.length,
                              itemBuilder: (context, index) {
                                String videoDate = DateFormat('MMM dd, yyyy')
                                    .format(videoData[index].dateAndTime);
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlayVideoScreen(
                                            video: videoData[index]),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 346.w,
                                        height: 192.h,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    videoData[index].thumbnail),
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
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                  child: TextWidget(
                                                      text: videoData[index].duration,
                                                      textColor: Colors.white,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                              radius: 20.spMax,
                                              backgroundImage: NetworkImage(
                                                  videoData[index].channelImage),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 235.w,
                                                  child: TextWidget(
                                                      text: videoData[index].title,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(height: 8.h),
                                                TextWidget(
                                                    text:
                                                        '${videoData[index].viewers} views  .  $videoDate',
                                                    textColor: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400)
                                              ],
                                            ),
                                            const Icon(Icons.more_vert_outlined,
                                                color: Colors.grey)
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 18.h)
                                    ],
                                  ),
                                );
                              }),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              width: 100.w,
                              height: 40.h,
                              child: ElevatedButton(
                                onPressed: () {
                                  videos = ref.refresh(videoProvider);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)),
                                    side: const BorderSide(width: 1, color: Colors.grey)),
                                child: Row(
                                  children: [
                                    TextWidget(
                                        text: 'Next',
                                        textColor: Colors.indigoAccent,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700),
                                    SizedBox(width: 5.w),
                                    const Icon(Icons.arrow_forward_ios,
                                        color: Colors.indigoAccent, size: 18),
                                  ],
                                ),),
                            ),
                          )
                        ],
                      );
                    },
                    error: (error, stackTrace) =>
                        Center(child: Text('Error: $error')),
                    loading: () {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height / 2.0,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ));
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
