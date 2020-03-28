import 'package:flutter/material.dart';
import '../header.dart';
 
class Search extends StatelessWidget {
  final String headerTitle = '検索';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: headerTitle),
      body: Center(child: Text(headerTitle)),
    );
  }
}