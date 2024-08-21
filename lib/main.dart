import 'package:flutter/material.dart';

import 'core/network/api_service.dart';
import 'features/video/data/repositories/video_repository_impl.dart';
import 'features/video/domain/use_cases/get_video.dart';
import 'features/video/presentation/pages/video_page.dart';

void main() {
  final apiService = ApiService();
  final videoRepository = VideoRepositoryImpl(apiService: apiService);
  final getVideo = GetVideo(repository: videoRepository);

  runApp(MyApp(getVideo: getVideo));
}

class MyApp extends StatelessWidget {
  final GetVideo getVideo;

  MyApp({required this.getVideo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Video List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPage(getVideo: getVideo),
    );
  }
}
