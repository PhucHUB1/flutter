import 'package:app_flutter/features/video/data/repositories/video_repository.dart';
import '../../../../core/network/api_service.dart';
import '../models/video_model.dart';

class VideoRepositoryImpl implements VideoRepository {
  final ApiService apiService;

  VideoRepositoryImpl({required this.apiService});

  @override
  Future<List<VideoModel>> getVideos(String singer) async {
    final videoData = await apiService.fetchVideos(singer);
    return videoData.map<VideoModel>((json) => VideoModel.fromJson(json)).toList();
  }
}