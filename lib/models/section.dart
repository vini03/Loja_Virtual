import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teste2/models/section_item.dart';
import 'package:provider/provider.dart';

class Section{
  Section.fromDocment(DocumentSnapshot document){
    name = document.data()['name'] as String;
    type = document.data()['type'] as String;
    items = (document.data()['items'] as List).map(
            (i) => SectionItem.fromMap(i as Map<String, dynamic>)).toList ();
  }
  String name;
  String type;
  List<SectionItem> items;

  @override
  String toString() {
    return 'Section{name: $name, type: $type, items: $items}';
  }

  static Section fromDocument(DocumentSnapshot document) {}
}