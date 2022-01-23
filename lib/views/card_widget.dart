import 'package:be_updated/view_model/news_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  NewsModel model;
  double wid, hei;
  CardWidget(this.model, this.wid, this.hei, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: wid,
      height: hei * 0.6,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        image: DecorationImage(
            image: NetworkImage(model.image_url), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              model.source_id,
              textAlign: TextAlign.start,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 10,
            child: Text(
              model.title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              model.pubDate,
              textAlign: TextAlign.end,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
