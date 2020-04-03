import 'package:flutter/material.dart';

class CustomCard {

  Widget createCard(String cardId, Map tweetData) {
    Widget widget;
    switch (cardId) {
      case 'text1':
        widget = _BaseCard(tweetData);
        break;
      default:
        widget = _BaseCard(tweetData);
    }
    return widget;
  }
  
}

class _BaseCard extends StatelessWidget {
  final Map _tweetData;

  _BaseCard(
    this._tweetData,
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
                    backgroundImage: NetworkImage(_tweetData['profileImageUrlHttps'])
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
                      Container(
                        color: Colors.yellow[200],
                        child: _Header(_tweetData),
                      ),
                      Container(
                        color: Colors.blue[200],
                        child: Text(_tweetData['text']),
                      ),
                      Container(
                        color: Colors.lightGreen[300],
                        child: _FooterButtons(_tweetData),
                      ),
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

class _Header extends StatelessWidget {
  Map _tweetData;
  
  _Header(
    this._tweetData,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 10,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 10,
                child: Text(
                  _tweetData['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                ' @' + _tweetData['screenName'],
                style: TextStyle(
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                ' ' + _tweetData['timeText'],
                style: TextStyle(
                  color: Colors.black54,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _FooterButtons extends StatelessWidget {
  Map _tweetData;
  _FooterButtons(
    this._tweetData,
  );
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      buttonPadding: EdgeInsets.all(0.0),
      alignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.chat_bubble_outline),
              iconSize: 18.0,
              onPressed: () {},
            ),
            Text(''),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.cached),
              iconSize: 18.0,
              onPressed: () {},
            ),
            Text(_tweetData['retweetCount'].toString()),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              iconSize: 18.0,
              onPressed: () {},
            ),
            Text(_tweetData['favoriteCount'].toString()),
          ],
        ),
        IconButton(
          icon: Icon(Icons.share),
          iconSize: 18.0,
          onPressed: () {},
        ),
      ],
    );
  }
}