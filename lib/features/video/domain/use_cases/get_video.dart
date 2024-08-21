
import '../../data/repositories/video_repository.dart';
import '../entities/video.dart';

class GetVideo {
  final VideoRepository repository;

  GetVideo({required this.repository});

  Future<List<Video>> call(String singer) async {
    final videoModels = await repository.getVideos(singer);
    return videoModels
        .map((model) => Video(
      videoID: model.videoID,
      videoTitle: model.videoTitle,
      videoThumbnailUrl: model.videoThumbnailUrl
    ))
        .toList();
  }
}
