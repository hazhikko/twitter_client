import 'package:flutter/material.dart';
import 'package:twitter_1user/twitter_1user.dart';
import 'dart:convert';
import 'dart:collection';
import '../header.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final String headerTitle = 'ホーム';
  LinkedHashMap _tweets = LinkedHashMap();
  String _timelineData = '';

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final String apiKey = 'Twitter Developerで取得したAPI Key';
    final String apiSecret = 'Twitter Developerで取得したAPI secret key';
    final String accessToken = 'Twitter Developerで取得したAccess token';
    final String accessSecret = 'Twitter Developerで取得したAccess token secret';

    final String userTimelinePath = 'statuses/home_timeline.json';

    Twitter twitter = new Twitter(apiKey, apiSecret, accessToken, accessSecret);

    final res = jsonDecode(await twitter.request('GET', userTimelinePath, {'count': '30'}));
    setState(() {
      for (int i = 0; i < res.length; i++){
        _tweets[i] = {
          'screenName' : res[i]['user']['screen_name'],
          'profileImageUrlHttps' : res[i]['user']['profile_image_url_https'],
          'text' : res[i]['text'],
        };
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: headerTitle),
      body: ListView.builder(
        itemCount: _tweets.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(_tweets[index]['profileImageUrlHttps']),
              ),
              title: Text(_tweets[index]['screenName']),
              subtitle: Text(_tweets[index]['text']),
              trailing: Icon(Icons.keyboard_arrow_down),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}