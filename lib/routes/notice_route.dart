import 'package:flutter/material.dart';
import '../ui/header.dart';
 
class Notice extends StatelessWidget {
  final String headerTitle = '通知';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: headerTitle),
      body: Center(child: Text(headerTitle)),
    );
  }
}