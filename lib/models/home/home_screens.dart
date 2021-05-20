import 'package:flutter/material.dart';
import 'package:teste2/common/custom_drawer/custom_drawer.dart';
import 'package:teste2/models/home/components/section_list.dart';
import 'package:teste2/models/home_manager.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 211, 118, 130),
                    Color.fromARGB(255, 253, 181, 168)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Loja Virtual'),
                  centerTitle: true,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () => Navigator.of(context).pushNamed('/cart'),
                  )
                ],
              ),
              Consumer<HomeManager>(
                builder: (_, homeManager, __){
                  final List<Widget> childreen = homeManager.sections.map<Widget>((section){
                    switch(section.type){
                      case 'List':
                        return SectionList(section);
                      case 'Staggered':
                        return Container();
                      default:
                        return Container();
                    }
                  }
                  ).toList();
                  return SliverList(
                    delegate: SliverChildListDelegate(childreen),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}