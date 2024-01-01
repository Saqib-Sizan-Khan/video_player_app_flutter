import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:video_player_app_flutter/providers/video_provider.dart';
import 'package:video_player_app_flutter/widgets/text_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(videoProvider.notifier).fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
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
                final videos = ref.watch(videoProvider);
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      String videoDate = DateFormat('MMM dd, yyyy')
                          .format(videos[index].dateAndTime);
                      return Column(
                        children: [
                          Container(
                            width: 346.w,
                            height: 192.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(videos[index].thumbnail),
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
                                      child: TextWidget(
                                          text: videos[index].duration,
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
                                  backgroundImage:
                                      NetworkImage(videos[index].channelImage),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 235.w,
                                      child: TextWidget(
                                          text: videos[index].title,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 8.h),
                                    TextWidget(
                                        text:
                                            '${videos[index].viewers} views  .  $videoDate',
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
                      );
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
