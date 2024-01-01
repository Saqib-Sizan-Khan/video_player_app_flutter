import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app_flutter/api_service/video_api.dart';
import 'package:video_player_app_flutter/model/video_model.dart';

final getVideosServiceProvider = Provider<GetVideosService>((ref) {
  return GetVideosService();
});

final videoProvider = FutureProvider<List<VideoModel>>((ref) async {
  final getVideoService = ref.read(getVideosServiceProvider);
  return getVideoService.fetchVideos();
});

final flickManagerProvider = Provider.autoDispose.family<FlickManager, String>((ref, videoUrl) {
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
  final flickManager = FlickManager(videoPlayerController: videoPlayerController);

  ref.onDispose(() {
    flickManager.dispose();
  });

  return flickManager;
});

