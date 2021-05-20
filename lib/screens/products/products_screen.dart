import 'package:flutter/material.dart';
import 'package:teste2/common/custom_drawer/custom_drawer.dart';
import 'package:teste2/common/custom_drawer/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:teste2/models/product_manager.dart';
import 'package:teste2/products/components/search_dialog.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        actions: <Widget>[
         Consumer<ProductManager>(
           builder: (_, productManager, __){
             if(productManager.search.isEmpty){
               return IconButton(
                 icon: Icon(Icons.search),
                 onPressed: () async{
                   final search = await showDialog<String>(context: context, builder: (_) => SearchDialog());
                   if(search != null){
                     context.read<ProductManager>().search = search;
                   }
                 },
               );
             }else{
               return IconButton(
                 icon: Icon(Icons.close),
                 onPressed: () async{
                   context.read<ProductManager>().search = '';
                 },
               );
             }
           },
         )
        ],
      ),
      );
  }
}
