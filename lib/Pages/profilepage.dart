import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Profile Page',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 20.0),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'john.doe@example.com',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
