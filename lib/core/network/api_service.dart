import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://dummyjson.com/products';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['products'];
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Map<String, dynamic>> fetchProductDetails(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load product details');
    }
  }
}