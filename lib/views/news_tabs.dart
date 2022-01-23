import 'package:be_updated/providers/news_provider.dart';
import 'package:be_updated/services/api_data_fetch.dart';
import 'package:be_updated/view_model/news_model.dart';
import 'package:be_updated/views/card_widget.dart';
import 'package:be_updated/views/inside_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:progress_indicators/progress_indicators.dart';

class NewsTabs extends StatefulWidget {
  String url;
  NewsTabs(this.url, {Key? key}) : super(key: key);

  @override
  State<NewsTabs> createState() => _NewsTabsState(url);
}

class _NewsTabsState extends State<NewsTabs> {
  late List<NewsModel> newsList = [];
  String url;
  _NewsTabsState(this.url);
  getNews() async {
    ApiDataFetch adf = ApiDataFetch(url);
    newsList = await adf.getNews() as List<NewsModel>;
    NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
    provider.setNewsList(newsList, url);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NewsProvider provider = Provider.of<NewsProvider>(context, listen: false);
    newsList = provider.getNewsList(url);
    if (newsList.isEmpty) getNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: (newsList.isEmpty)
            ? MediaQuery.of(context).size.height / 1.32
            : MediaQuery.of(context).size.height,
        alignment: (newsList.isEmpty) ? Alignment.center : Alignment.topLeft,
        color: Colors.grey[300],
        child: (newsList.isEmpty)
            ? Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Updating  '),
                  JumpingDotsProgressIndicator(
                    fontSize: 25.0,
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Be Updated'),
                  const Text(
                    'Today',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.topLeft,
                    width: MediaQuery.of(context).size.width - 20,
                    height: MediaQuery.of(context).size.height / 1.43,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: newsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          InsideCard(newsList[index])));
                            },
                            title: CardWidget(
                                newsList[index],
                                MediaQuery.of(context).size.width - 20,
                                MediaQuery.of(context).size.height / 1.3),
                          ));
                        }),
                  )
                ],
              ),
      ),
    );
  }
}
