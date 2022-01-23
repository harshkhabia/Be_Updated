import 'package:be_updated/url/all_url.dart';
import 'package:be_updated/views/news_tabs.dart';
import 'package:be_updated/views/on_search.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

final controller = TextEditingController();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onSubmitted: (searchedNews) {
                        controller.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OnSearch(AllUrl.baseUrl + searchedNews)));
                      },
                      decoration: const InputDecoration(
                          hintText: 'search', border: InputBorder.none),
                    ),
                    flex: 9,
                  )
                ],
              ),
            ),
            shadowColor: Colors.grey[300],
            elevation: 0,
            backgroundColor: Colors.grey[300],
            bottom: TabBar(
              padding: EdgeInsets.only(left: 12, right: 10),
              isScrollable: true,
              labelPadding: const EdgeInsets.all(7),
              indicatorColor: Colors.white,
              indicator: RectangularIndicator(
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  color: Colors.white),
              tabs: const [
                Text(
                  'Entertainment',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Text('Buissness',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text('Science',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text('Sports',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text('Trending',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                Text('Politics',
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              NewsTabs(AllUrl.entertainment),
              NewsTabs(AllUrl.buissness),
              NewsTabs(AllUrl.science),
              NewsTabs(AllUrl.sports),
              NewsTabs(AllUrl.trending),
              NewsTabs(AllUrl.political),
            ],
          )),
    );
  }
}
