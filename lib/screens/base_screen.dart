import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste2/common/custom_drawer/custom_drawer.dart';
import 'package:teste2/models/home/home_screens.dart';
import 'package:teste2/models/page_manager.dart';
import 'package:teste2/screens/login/login_screen.dart';
import 'package:teste2/screens/products/products_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
         HomeScreen(),
          ProductsScreen(),
         LoginScreen(),
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home 4'),
            ),
          ),
        ],
      ),
    );
  }
}