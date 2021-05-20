import 'package:teste2/models/section.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeManager {
  HomeManager(){
    _loadSections;
  }
  List<Section> sections = [];
  final Firestore firestore = Firestore.instance;

  Future<void> _loadSections() async {
    firestore.collection('HomeProdutos').snapshots().listen((snapshot) {
      sections.clear();
      for(final DocumentSnapshot document in snapshot.documents){
        sections.add(Section.fromDocument(document));
      }
      print(sections);
    });
  }
}

class Firestore {
  static Firestore instance;

  collection(String s) {}
}