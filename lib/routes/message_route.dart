import 'package:flutter/material.dart';
import '../header.dart';
 
class Message extends StatelessWidget {
  final String headerTitle = 'メッセージ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: headerTitle),
      body: Center(child: Text(headerTitle)),
    );
  }
}