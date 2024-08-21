import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  final http.Client client;

  ApiService(this.baseUrl, this.client);

  Future<http.Response> get(String endpoint) async {
    final url = '$baseUrl$endpoint';
    final response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to load data');
    }
    print(response);
    return response;
  }
}
