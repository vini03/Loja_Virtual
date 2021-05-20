import 'package:flutter/material.dart';

class ProductListTitle extends StatelessWidget {

  ProductListTitle(this.product);

  final ProductListTitle product;

  get images => null;

  String get name => null;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(product.images.first),
            ),
            Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        )
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}