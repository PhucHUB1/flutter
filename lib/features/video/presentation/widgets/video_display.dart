import 'package:flutter/material.dart';

import '../../domain/entities/video.dart';

class VideoDisplay extends StatelessWidget {
  final Video video;

  VideoDisplay({required this.video});

  @override
  Widget build(BuildContext context) {
    return ListTile(
    children: [
      Text(
        video.videoTitle,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 8,height: 5,),
      Image.network(video.videoThumbnailUrl),
    ]
    );
  }
}
