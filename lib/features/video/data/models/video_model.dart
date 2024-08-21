
import 'package:app_flutter/features/video/domain/entities/video.dart';

class VideoModel extends Video {
  VideoModel({
    required String videoTitle,
    required String videoID,
    required String videoThumbnailUrl
  }) : super(

    videoTitle: videoTitle,
    videoID: videoID,
    videoThumbnailUrl: videoThumbnailUrl
  );

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoTitle: json['snippet']['title'],
      videoID: json['id']['videoId'],
      videoThumbnailUrl: json['snippet']['thumbnails']['medium']['url']
    );
  }
}
