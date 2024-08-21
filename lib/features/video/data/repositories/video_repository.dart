import '../models/video_model.dart';

abstract class VideoRepository {
  Future<List<VideoModel>> getVideos(String singer);
}