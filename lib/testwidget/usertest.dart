import 'dart:async';

import 'package:flutter/material.dart';

import 'package:colorex/utils/users.dart';

class MyUserTest extends StatefulWidget {
  const MyUserTest({super.key});

  @override
  State<MyUserTest> createState() => _MyUserTestState();
}

class _MyUserTestState extends State<MyUserTest> {
  Map<String, dynamic>? data;
  String name = 'hello';

  Future<void> fetchData() async {
    data = await getDataFromFirestore('User', 'uZSc0Mxv6MfuawDheNusPizdw142');

    if (data != null) {
      // Data retrieved successfully, do something with it
      setState(() {
        name = data!['Display_Name'];
      });
      print('Data retrieved: $data');
    } else {
      // Handle document not found or error fetching data
      print('Document not found or error fetching data');
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Text(name),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
      ),
    );
  }
}
