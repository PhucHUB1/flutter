import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductDisplay extends StatelessWidget {
  final Product product;

  ProductDisplay({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 80,
        height: 80,
        child: Image.network(
          product.thumbnail,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(product.title),
      subtitle: Text(product.description),
      trailing: Text(
        '\$${product.price.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
