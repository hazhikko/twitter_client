import 'package:twitter_1user/twitter_1user.dart';
import 'dart:convert';

class TwitterApiModel {
  /// TwitterAPIから情報を取得する
  /// 
  /// [path]に対して[param]を付与し、Getで接続する
  /// 取得したJsonをDecodeして返却する
  Future getJson(String path, Map param) async {
    final String apiKey = 'Twitter Developerで取得したAPI Key';
    final String apiSecret = 'Twitter Developerで取得したAPI secret key';
    final String accessToken = 'Twitter Developerで取得したAccess token';
    final String accessSecret = 'Twitter Developerで取得したAccess token secret';

    Twitter twitter = new Twitter(apiKey, apiSecret, accessToken, accessSecret);

    return jsonDecode(await twitter.request('GET', path, param));
  }
}