import 'package:flutter/material.dart';
import 'header.dart';
import 'root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: ThemeData(
        primaryColor: Colors.pink[100],
      ),
      home: Scaffold(   
        appBar: Header(),
        body: Center(child: Text('ホーム')),
        bottomNavigationBar: RootWidget(),
      ),
    );
  }
}