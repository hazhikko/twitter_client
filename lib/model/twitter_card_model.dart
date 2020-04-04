import '../ui/custom_card.dart';
import '../model/twitter_api_model.dart';
import '../util/convert_text.dart';

class TwitterCardModel {

  Future<List> CreateCardList(String apiName) async{
    List _cardList = [];
    final _tweets = await GetTweetsJson(apiName);

    CustomCard customCard = CustomCard();
    for (var i = 0; i < _tweets.length; i++) {
      _cardList.add(customCard.createCard('text1', _tweets[i]));
    }
    return _cardList;
  }

  Future<List> GetTweetsJson(String apiName) async{
    String _userTimelinePath;
    Map<String, String> _userTimelineParam;

    switch (apiName) {
      case 'home_timeline':
          _userTimelinePath = 'statuses/home_timeline.json';
          _userTimelineParam = {
            'count': '3',
            'include_entities': 'true',
          };
        break;
      default:
          _userTimelinePath = 'statuses/home_timeline.json';
          _userTimelineParam = {
            'count': '10',
            'include_entities': 'true',
          };
    }

    final jsonData = await TwitterApiModel().GetJson(_userTimelinePath, _userTimelineParam);
    List _tweets = [];
    for (int i = 0; i < jsonData.length; i++){
      final String _timeText = ConvertText().TwitterTimetamp(jsonData[i]['created_at']);
      _tweets.add(
        {
          'timeText': _timeText,
          'name': jsonData[i]['user']['name'],
          'screenName': jsonData[i]['user']['screen_name'],
          'profileImageUrlHttps': jsonData[i]['user']['profile_image_url_https'],
          'text': jsonData[i]['text'],
          'favoriteCount': jsonData[i]['favorite_count'] != 0 ? jsonData[i]['favorite_count'] : '',
          'retweetCount': jsonData[i]['retweet_count'] != 0 ? jsonData[i]['retweet_count'] : '',
        }
      );
    }
    return _tweets;
  }
}