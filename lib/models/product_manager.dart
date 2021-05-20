import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teste2/models/product.dart';

import 'home_manager.dart';

class ProductManager extends ChangeNotifier {
  ProductManager(){
    _loadAllProducts();
  }
  final Firestore firestore = Firestore.instance;
  List<Product> allProducts = [];
  String _search = '';
  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }

  List<Product> get filterdProducts {
    final List<Product> filteredProducts = [];

    if(search.isEmpty){
      filterdProducts.addAll(allProducts);
    } else {
      filterdProducts.addAll(
          allProducts.where(
                  (p) => p.name.toLowerCase().contains(search.toLowerCase())
          )
      );
    }
    return filteredProducts;
  }
  Future<void> _loadAllProducts() async {
    final QuerySnapshot snapshot =
    (await firestore.collection('products').getDocuments()) as QuerySnapshot;

    var snapProducts;
    allProducts = snapProducts.documents.map(
            (d) => Product.fromDocument(d)).toList();

    notifyListeners();
  }

  void notifyListeners() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Product {
  get name => null;

  static fromDocument(d) {}

}

class QuerySnapshot {
}