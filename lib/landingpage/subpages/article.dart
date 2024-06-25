import 'package:flutter/material.dart';

import 'articlecard.dart';

class MyArticleWidget extends StatelessWidget {
  MyArticleWidget({super.key});

  final List<Map<String, dynamic>> data = [
    {"link": "https://colorwise.me/images/misc/self-test.a2217fcb.png", "title": "You're a natural beauty"},
    {"link": "https://colorwise.me/images/misc/self-test.a2217fcb.png", "title": "You're a natural beauty"},
    {"link": "https://colorwise.me/images/misc/self-test.a2217fcb.png", "title": "You're a natural beauty"},
    {"link": "https://colorwise.me/images/misc/self-test.a2217fcb.png", "title": "You're a natural beauty"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ArticleCard(
            imageUrl: data[index]["link"],
            title: data[index]["title"],
          );
        }
      ),
    );
  }
}
