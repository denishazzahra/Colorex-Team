import 'package:flutter/material.dart';

class MyBookmarkPage extends StatelessWidget {
  const MyBookmarkPage({super.key});

  @override
  Widget build(context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Bookmark Page'),
          Text('List your bookmark in here')
        ],
      ),
    );
  }
}