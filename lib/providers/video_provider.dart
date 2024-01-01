import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_app_flutter/api_service/video_api.dart';
import 'package:video_player_app_flutter/model/video_model.dart';

final getVideosServiceProvider = Provider<GetVideosService>((ref) {
  return GetVideosService();
});

final videoProvider = FutureProvider<List<VideoModel>>((ref) async {
  final getVideoService = ref.read(getVideosServiceProvider);
  return getVideoService.fetchVideos();
});