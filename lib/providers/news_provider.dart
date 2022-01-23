import 'package:be_updated/url/all_url.dart';
import 'package:be_updated/view_model/news_model.dart';
import 'package:flutter/widgets.dart';

class NewsProvider with ChangeNotifier {
  late List<NewsModel> entertainmentNewsList = [];
  late List<NewsModel> buissnessNewsList = [];
  late List<NewsModel> scienceNewsList = [];
  late List<NewsModel> sportsNewsList = [];
  late List<NewsModel> trendingNewsList = [];
  late List<NewsModel> politicalNewsList = [];

  setNewsList(List<NewsModel> newsList, String url) {
    if (url == AllUrl.entertainment)
      this.entertainmentNewsList = newsList;
    else if (url == AllUrl.buissness)
      this.buissnessNewsList = newsList;
    else if (url == AllUrl.science)
      this.scienceNewsList = newsList;
    else if (url == AllUrl.sports)
      this.sportsNewsList = newsList;
    else if (url == AllUrl.trending)
      this.trendingNewsList = newsList;
    else if (url == AllUrl.political) this.politicalNewsList = newsList;
  }

  getNewsList(String url) {
    if (url == AllUrl.entertainment)
      return entertainmentNewsList;
    else if (url == AllUrl.buissness)
      return buissnessNewsList;
    else if (url == AllUrl.science)
      return scienceNewsList;
    else if (url == AllUrl.sports)
      return sportsNewsList;
    else if (url == AllUrl.trending)
      return trendingNewsList;
    else
      return politicalNewsList;
  }
}
