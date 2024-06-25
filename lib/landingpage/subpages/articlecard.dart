import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ArticleCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15.0),
            ),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}