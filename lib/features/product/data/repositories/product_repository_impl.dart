import 'package:app_flutter/features/product/data/repositories/product_repository.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';


class ProductRepositoryImpl implements ProductRepository {
  final ApiService apiService;

  ProductRepositoryImpl({required this.apiService});

  @override
  Future<List<Product>> getAllProducts() async {
    final productsJson = await apiService.fetchProducts();
    return productsJson.map<Product>((json) => ProductModel.fromJson(json)).toList();
  }

  @override
  Future<Product> getProductDetail(int id) async {
    final productJson = await apiService.fetchProductDetails(id);
    return ProductModel.fromJson(productJson);
  }
  }


