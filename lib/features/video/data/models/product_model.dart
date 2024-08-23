
import 'package:app_flutter/features/video/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required double price,
    required String thumbnail, // Include this parameter
  }) : super(
       id: id,
      title: title,
      description: description,
     price: price,
    thumbnail: thumbnail
  );
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      thumbnail: json['thumbnail'],
    );
  }
}