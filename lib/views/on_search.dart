import 'package:be_updated/url/all_url.dart';
import 'package:be_updated/views/news_tabs.dart';
import 'package:flutter/material.dart';

TextEditingController controller = TextEditingController();

class OnSearch extends StatelessWidget {
  String url;
  OnSearch(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[300],
        elevation: 0,
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
                  onSubmitted: (searchedText) {
                    controller.clear();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OnSearch(AllUrl.baseUrl + searchedText)));
                  },
                  decoration: InputDecoration(
                      hintText: 'search', border: InputBorder.none),
                ),
                flex: 9,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 40,
              color: Colors.grey[300],
            ),
            NewsTabs(url),
          ],
        ),
      ),
    );
  }
}
