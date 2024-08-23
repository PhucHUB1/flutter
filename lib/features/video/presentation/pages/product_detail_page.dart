import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(product.description, style: TextStyle(fontSize: 15),),
            SizedBox(height: 20),
            Text(
                'Price: \$${product.price.toStringAsFixed(2)}',
                 style:TextStyle(fontSize: 18,color: Colors.red) ,),
            SizedBox(height: 20),
            Image.network(product.thumbnail),
          ],
        ),
      ),
    );
  }
}
