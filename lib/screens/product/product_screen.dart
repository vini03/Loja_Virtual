import 'package:flutter/material.dart';
import 'package:teste2/models/product_manager.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen(this.product);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
    );
  }
}
