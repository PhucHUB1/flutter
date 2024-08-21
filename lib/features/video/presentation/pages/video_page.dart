import 'package:app_flutter/features/video/domain/entities/video.dart';
import 'package:app_flutter/features/video/domain/use_cases/get_video.dart';
import 'package:app_flutter/features/video/presentation/widgets/video_display.dart';
import 'package:flutter/material.dart';


class VideoPage extends StatefulWidget {
  final GetVideo getVideo;

  VideoPage({required this.getVideo});

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<Video> videos = [];
  final TextEditingController controller = TextEditingController();

  void fetchVideos() async {
    final videoList = await widget.getVideo(controller.text);
    setState(() {
      videos = videoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tìm kiếm bài hát trên YouTube'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Nhập tên ca sĩ',
              ),
              onSubmitted: (value) => fetchVideos(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: fetchVideos,
              child: Text('Tìm kiếm'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return VideoDisplay(video: video);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
