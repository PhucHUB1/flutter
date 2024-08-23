
import 'package:flutter/material.dart';

import 'core/network/api_service.dart';
import 'features/video/data/repositories/product_repository_impl.dart';
import 'features/video/domain/use_cases/get_products.dart';
import 'features/video/presentation/pages/product_page.dart';

void main() {
  final apiService = ApiService();
  final productRepository = ProductRepositoryImpl(apiService: apiService);
  final getProducts = GetProducts(repository: productRepository);

  runApp(MyApp(getProducts: getProducts));
}

class MyApp extends StatelessWidget {
  final GetProducts getProducts;

  MyApp({required this.getProducts});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductPage(getProducts: getProducts),
    );
  }
}
