import '../ui/custom_card.dart';
import '../model/twitter_api_model.dart';

class TwitterCardModel {

  Future<List> CreateCardList(String apiName) async{
    List _cardList = [];
    final _tweets = await GetTweetsJson(apiName);

    CustomCard customCard = CustomCard();
    for (var i = 0; i < _tweets['screenName'].length; i++) {
      _cardList.add(customCard.createCard(
                      'text1',
                      _tweets['screenName'][i],
                      _tweets['profileImageUrlHttps'][i],
                      _tweets['text'][i],
                    ));
    }
    return _cardList;
  }

  Future<Map> GetTweetsJson(String apiName) async{
    String _userTimelinePath = 'statuses/home_timeline.json';
    Map<String, String> _userTimelineParam;

    switch (apiName) {
      case 'home_timeline':
          _userTimelinePath = 'statuses/home_timeline.json';
          _userTimelineParam = {
            'count': '50',
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

    Map<String, List<String>> _tweets = {
      'screenName':[],
      'profileImageUrlHttps':[],
      'text':[],
    };

    final jsonData = await TwitterApiModel().GetJson(_userTimelinePath, _userTimelineParam);

    for (int i = 0; i < jsonData.length; i++){
      _tweets['screenName'].add(jsonData[i]['user']['screen_name']);
      _tweets['profileImageUrlHttps'].add(jsonData[i]['user']['profile_image_url_https']);
      _tweets['text'].add(jsonData[i]['text']);
    }
    return _tweets;
  }
}