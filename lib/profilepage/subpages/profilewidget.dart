import 'package:colorex/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    String? displayName = userDataProvider.displayName;
    String? photoURL = userDataProvider.photoURL;
    String? username = userDataProvider.userName;

    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [

                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text('0'),
                      ),
                      Center(
                        child: Text('postingan'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text('0'),
                      ),
                      Center(
                        child: Text('ulasan'),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: Text('0'),
                      ),
                      Center(
                        child: Text('pengikut'),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}