import 'package:flutter/material.dart';

class CustomCard {

  Widget createCard(String cardId, String screenName, String profileImageUrlHttps, String text) {
    Widget widget;
    switch (cardId) {
      case 'text1':
        widget = _BaseCard(screenName, profileImageUrlHttps, text);
        break;
      default:
        widget = _BaseCard(screenName, profileImageUrlHttps, text);
    }
    return widget;
  }
  
}

class _BaseCard extends StatelessWidget {
  final String _screenName;
  final String _profileImageUrlHttps;
  final String _text;

  _BaseCard(
    this._screenName,
    this._profileImageUrlHttps,
    this._text,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.orange[300],
                  padding: EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(_profileImageUrlHttps)
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color:Colors.teal[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_screenName),
                      Text(_text),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}