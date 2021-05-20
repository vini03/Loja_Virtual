import 'package:flutter/cupertino.dart';
import 'package:teste2/models/cart_manager.dart';
import 'package:teste2/models/cart_products.dart';
import 'package:teste2/models/product.dart';
import 'package:teste2/models/product_manager.dart';
import 'package:teste2/models/user_manager.dart';

class CartManager extends ChangeNotifier{
  List<CartProduct> items = [];
  void addToCart(Product product){
    items.add(CartProduct().fromProduct(product));
  }

  updateUser(UserManager userManager) {}
}