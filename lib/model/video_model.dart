class VideoModel {
  final String thumbnail;
  final String title;
  final DateTime dateAndTime;
  final String manifest;
  final String channelImage;
  final String channelName;
  final String channelSubscriber;
  final String viewers;
  final String duration;

  VideoModel({
    required this.thumbnail,
    required this.title,
    required this.dateAndTime,
    required this.manifest,
    required this.channelImage,
    required this.channelName,
    required this.channelSubscriber,
    required this.viewers,
    required this.duration,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      thumbnail: json['thumbnail'],
      title: json['title'],
      dateAndTime: DateTime.parse(json['date_and_time']),
      manifest: json['manifest'],
      channelImage: json['channel_image'],
      channelName: json['channel_name'],
      channelSubscriber: json['channel_subscriber'],
      viewers: json['viewers'],
      duration: json['duration'],
    );
  }
}
