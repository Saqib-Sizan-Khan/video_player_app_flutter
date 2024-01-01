import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player_app_flutter/model/video_model.dart';
import 'package:video_player_app_flutter/widgets/action_container.dart';
import 'package:video_player_app_flutter/widgets/text_widget.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends ConsumerStatefulWidget {
  const PlayVideoScreen({super.key, required this.video});

  final VideoModel video;

  @override
  ConsumerState<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends ConsumerState<PlayVideoScreen> {
  late FlickManager flickManager;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.networkUrl(Uri.parse(widget.video.manifest)));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(widget.video.dateAndTime);

    return Scaffold(
      body: Column(
        children: [
          Container(
              width: double.maxFinite,
              height: 211.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.video.thumbnail),
                      fit: BoxFit.cover)),
              child: FlickVideoPlayer(
                flickManager: flickManager,
              )),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: TextWidget(
                      text: widget.video.title,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 8.h),
                TextWidget(
                    text: difference.inDays == 0
                        ? '${widget.video.viewers} views  .  Today'
                        : '${widget.video.viewers} views  .  ${difference.inDays} days ago',
                    textColor: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionCon(
                        width: 125.w,
                        icon: "assets/images/love.png",
                        title: "Mash Allah (12K)"),
                    ActionCon(
                        width: 80.w,
                        icon: "assets/images/like.png",
                        title: "LIKE (12K)"),
                    ActionCon(
                        width: 60.w,
                        icon: "assets/images/share.png",
                        title: "SHARE"),
                    ActionCon(
                        width: 65.w,
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
                              NetworkImage(widget.video.channelImage),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                text: widget.video.channelName,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                            TextWidget(
                                text:
                                    '${widget.video.channelSubscriber} Subscribers',
                                textColor: Colors.grey,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 109.w,
                      height: 40.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          const Icon(Icons.add, color: Colors.white, size: 16),
                          SizedBox(width: 8.w),
                          TextWidget(
                              text: 'Subscribe',
                              textColor: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextWidget(
                        text: 'Comments  7.5K',
                        textColor: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    Image.asset("assets/images/arrow.png")
                  ],
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Add Comment',
                      hintStyle: const TextStyle(color: Colors.grey),
                      suffixIcon:
                          const Icon(Icons.send_rounded, color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2)),
                ),
                SizedBox(height: 16.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 16.r,
                      backgroundImage:
                          const AssetImage("assets/images/test4.png"),
                    ),
                    SizedBox(width: 7.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Fahmida khanom ',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '2 days ago',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        SizedBox(
                          width: 306.w,
                          child: const TextWidget(
                              text:
                                  "হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(height: 32),
        ],
      ),
    );
  }
}
