import 'package:flutter/material.dart';
// import 'package:colorex/widget/costum_background.dart';
// import 'package:colorex/widget/costum_background2.dart';
import 'package:colorex/detectpage/resultpage/autumnresult.dart';
import 'package:colorex/detectpage/resultpage/springresult.dart';
import 'package:colorex/detectpage/resultpage/summerresult.dart';
import 'package:colorex/detectpage/resultpage/winterresult.dart';
import 'package:colorex/widget/costum_button.dart';

import 'package:colorex/detectpage/rulespage.dart';
// import 'package:colorex/widget/costum_textfield.dart';
// import 'package:colorex/widget/costum_community_post.dart';
import 'package:colorex/testwidget/cameratest2.dart';
import 'package:colorex/communitypage/subpages/newpostpage.dart';

class MyTestPage extends StatelessWidget {
  const MyTestPage({super.key});

  @override
  Widget build(context) {
    //TextEditingController coba = TextEditingController();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(),
          // const MyCommunityPost(data: {
          //   "Username" : "hakari",
          //   "Season" : "Autumn",
          //   "Caption" : [
          //     "Autumn", "Great Soul", "Hello World","Great Soul", "Hello World"
          //   ],
          //   "Photo_URL" : "A",
          //   "content" : "Hello ariq maulana tazakka, this is your first post for the comunity of colorex, hope you love the app",
          //   "Like" : 3234,
          //   "Comment" : 123,
          //   "Bookmark" : 124,
          // },
          // ),
          // const MyCommunityPost(data: {
          //   "Username" : "hakari",
          //   "Season" : "Autumn",
          //   "Caption" : [
          //     "Autumn", "Great Soul", "Hello World","Great Soul", "Hello World"
          //   ],
          //   "Photo_URL" : "A",
          //   "content" : "Hello ariq maulana tazakka, this is your first post for the comunity of colorex, hope you love the app",
          //   "Like" : 3234,
          //   "Comment" : 143,
          //   "Bookmark" : 32,
          // }
          // )
          //MyBackground2(),
          MyCostumButtton1(
            buttonColor: Theme.of(context).primaryColor, 
            buttonText: "Autumn Result", 
            func:  () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyAutumnResultPage()));
            },
          ),
          const SizedBox(height: 24,),
          MyCostumButtton1(
            buttonColor: Theme.of(context).primaryColor, 
            buttonText: "Winter Result", 
            func:  () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyWinterResultPage()));
            },
          ),
          const SizedBox(height: 24,),
          MyCostumButtton1(
            buttonColor: Theme.of(context).primaryColor, 
            buttonText: "Spring Result", 
            func:  () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MySpringResultPage()));
            },
          ),
          const SizedBox(height: 24,),
          MyCostumButtton1(
            buttonColor: Theme.of(context).primaryColor, 
            buttonText: "Summer Result", 
            func:  () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MySummerResultPage()));
            },
          ),
          // const CameraPreviewWidget(),
        ],
      ),
    );
  }
}
