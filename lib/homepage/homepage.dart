import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'subpages/homepage.dart';
//import 'subpages/feedpage.dart';
//import 'subpages/bookmarkpage.dart';
//import 'subpages/chatpage.dart';
import 'subpages/profilepage.dart';
import 'subpages/testpage.dart';
import 'package:colorex/testwidget/usertest.dart';
import 'package:colorex/landingpage/landingpage.dart';

import 'package:colorex/detectpage/predetectpage.dart';
import 'package:colorex/communitypage/communitypage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final String vectorHome = "lib/homepage/asset/svg/Vector_Community.svg";
  final String vectorBookmark = "lib/homepage/asset/svg/Vector_Bookmark.svg";
  final String vectorChat = "lib/homepage/asset/svg/Vector_Chat.svg";
  final String vectorUser = "lib/homepage/asset/svg/Vector_User.svg";
  final String vectorKamera = 'lib/homepage/asset/svg/Vector_Kamera.svg';

  final String vectorHomeActive = "lib/homepage/asset/svg/Vector_Community.svg";
  final String vectorBookmarkActive =
      "lib/homepage/asset/svg/Vector_Bookmark.svg";
  final String vectorChatActive = "lib/homepage/asset/svg/Vector_Chat.svg";
  final String vectorUserActive = "lib/homepage/asset/svg/Vector_User.svg";

  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";

  static const List<Widget> _widgetOptions = <Widget>[
    // MyCommunityPage(),
    MyLandingPage(),
    MyPreDetectPage(),
    // MyBookmarkPage(),
    // MyChatPage(),
    // MyCommunityFeedPage(),
    MyProfilePage(),
    MyTestPage(),
    MyUserTest(),

    Text('My Community'),
    Text('My Bookmark'),
    Text('My Chat'),
    Text('My Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1.0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(vectorColorex, height: 24),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(246, 246, 246, 1.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // child: Container(
      //   color: Colors.yellow,
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7), // Shadow color
              spreadRadius: 6, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, 5), // Offset
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(vectorHome, height: 25),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(vectorBookmark, height: 25),
            //   label: 'BookMark',
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(vectorKamera, height: 25),
              label: 'Persona',
            ),
            // BottomNavigationBarItem(
            //   icon: SvgPicture.asset(vectorChat, height: 25),
            //   label: 'Community',
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(vectorUser, height: 25),
              label: 'Profile',
            ),
           // if (kDebugMode)
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'in build',
              ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: Theme.of(context).textTheme.labelSmall,
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
