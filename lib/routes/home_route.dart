import 'package:flutter/material.dart';
import 'package:twitter_1user/twitter_1user.dart';
import 'dart:convert';
import '../header.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final String screenName = 'ホーム';
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
        _timelineData += res[i]['text'] + '\n'; // textだけ取得
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(headerTitle: screenName),
      body: Center(child: Text(_timelineData)),
    );
  }
}