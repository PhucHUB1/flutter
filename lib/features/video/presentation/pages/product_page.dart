import 'package:app_flutter/features/video/domain/entities/product.dart';
import 'package:app_flutter/features/video/domain/use_cases/get_products.dart';
import 'package:app_flutter/features/video/presentation/pages/product_detail_page.dart';

import 'package:flutter/material.dart';

import '../widgets/product_display.dart';

class ProductPage extends StatefulWidget {
  final GetProducts getProducts;

  ProductPage({required this.getProducts});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    final productList = await widget.getProducts();
    setState(() {
      products = productList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: ProductDisplay(product: product),
          );
        },
      ),
    );
  }
}
