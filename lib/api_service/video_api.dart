import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:video_player_app_flutter/model/video_model.dart';

class GetVideosService {
  Future<List<VideoModel>> fetchVideos() async {
    final response = await http.get(
        Uri.parse("https://test-ximit.mahfil.net/api/trending-video/1?page=1"));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> videoData = jsonData['results'];
      return List<VideoModel>.from(
          videoData.map((video) => VideoModel.fromJson(video)));
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
