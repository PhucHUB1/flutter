import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'AIzaSyDEFt5aTpOtgdrXAE3dmyY16Wl6D5qRym4';

  Future<List<dynamic>> fetchVideos(String singer) async {
    final url =
        'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$singer&type=video&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      return [];
    }
  }
}