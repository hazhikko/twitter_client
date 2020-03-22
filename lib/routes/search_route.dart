import 'package:flutter/material.dart';
import '../header.dart';
 
class Search extends StatelessWidget {
  final String screenName = '検索';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: screenName),
      body: Center(child: Text(screenName)),
    );
  }
}