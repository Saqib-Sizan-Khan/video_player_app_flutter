import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_app_flutter/model/video_model.dart';

class VideoNotifier extends StateNotifier<List<VideoModel>> {
  VideoNotifier() : super([]);

  Future<void> fetchVideos() async {
    try {
      final response = await http.get(Uri.parse("https://test-ximit.mahfil.net/api/trending-video/1?page=1"));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        List<dynamic> videoData = jsonData['results'];
        state = List<VideoModel>.from(videoData.map((video) => VideoModel.fromJson(video)));
      } else {
        state = [];
      }
    } catch (e) {
      print(e);
    }
  }
}

