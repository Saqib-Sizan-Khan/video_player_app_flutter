class VideoModel {
  final String thumbnail;
  //final int id;
  final String title;
  final String dateAndTime;
  //final String slug;
  //final String createdAt;
  //final String manifest;
  //final int liveStatus;
  //final String liveManifest;
  //final bool isLive;
  final String channelImage;
  //final String channelName;
  //final String channelUsername;
  //final bool isVerified;
  //final String channelSlug;
  //final String channelSubscriber;
  //final int channelId;
  //final String type;
  final String viewers;
  final String duration;
  //final String objectType;

  VideoModel({
    required this.thumbnail,
    // required this.id,
    required this.title,
    required this.dateAndTime,
    // required this.slug,
    // required this.createdAt,
    // required this.manifest,
    // required this.liveStatus,
    // required this.liveManifest,
    // required this.isLive,
    required this.channelImage,
    // required this.channelName,
    // required this.channelUsername,
    // required this.isVerified,
    // required this.channelSlug,
    // required this.channelSubscriber,
    // required this.channelId,
    // required this.type,
    required this.viewers,
    required this.duration,
    // required this.objectType,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      thumbnail: json['thumbnail'],
      // id: json['id'],
      title: json['title'],
      dateAndTime: json['date_and_time'],
      // slug: json['slug'],
      // createdAt: json['created_at'],
      // manifest: json['manifest'],
      // liveStatus: json['live_status'],
      // liveManifest: json['live_manifest'] ?? '',
      // isLive: json['is_live'],
      channelImage: json['channel_image'],
      // channelName: json['channel_name'],
      // channelUsername: json['channel_username'],
      // isVerified: json['is_verified'],
      // channelSlug: json['channel_slug'],
      // channelSubscriber: json['channel_subscriber'],
      // channelId: json['channel_id'],
      // type: json['type'],
      viewers: json['viewers'],
      duration: json['duration'],
      // objectType: json['object_type'],
    );
  }
}
