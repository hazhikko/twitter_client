import 'package:flutter/material.dart';
import '../ui/header.dart';
import '../model/twitter_card_model.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final String headerTitle = 'ホーム';
  List _cardList = List<TwitterCardModel>();

  @override
  void initState() {
    super.initState();
    _load();
    setState(() {});
  }

  Future<void> _load() async {
    _cardList = await TwitterCardModel().createCardList('home_timeline');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: headerTitle),
      body: FutureBuilder(
        future: _load(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: _cardList.length,
              itemBuilder: (BuildContext context, int index) {
                return _cardList[index];
              }
            );
          } else {
            return Center(child:
              Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
      ),
    );
  }
}