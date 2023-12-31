import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_app_flutter/api_service/video_api.dart';
import 'package:video_player_app_flutter/model/video_model.dart';

final videoProvider = StateNotifierProvider<VideoNotifier, List<VideoModel>>((ref) {
  return VideoNotifier();
});