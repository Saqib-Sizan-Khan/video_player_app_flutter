import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_app_flutter/model/video_model.dart';

HttpClient client = HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

class VideoNotifier extends StateNotifier<List<VideoModel>> {
  VideoNotifier() : super([]);

  Future<void> fetchVideos() async {
    try {
      final response = await client.getUrl(Uri.parse("https://test-ximit.mahfil.net/api/trending-video/1?page=1"));
      final httpResponse = await response.close();
      if (httpResponse.statusCode == 200) {
        final data = await httpResponse.transform(utf8.decoder).join();
        Map<String, dynamic> jsonData = json.decode(data);
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

