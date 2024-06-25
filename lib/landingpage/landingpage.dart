import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:colorex/widget/costum_background.dart';
// import 'temp.dart';
import 'subpages/article.dart';

class MyLandingPage extends StatelessWidget {
  const MyLandingPage({super.key});
  final String vectorRect1 = "lib/homepage/asset/svg/Vector_Rectangle1.svg";
  final String vectorRect2 = "lib/homepage/asset/svg/Vector_Rectangle2.svg";
  final String vectorRect3 = "lib/homepage/asset/svg/Vector_Rectangle3.svg";
  final String vectorColorex = "lib/homepage/asset/svg/Vector_Colorex.svg";
  final int notif = 0;

  @override
  Widget build(context) {
    User? user = FirebaseAuth.instance.currentUser;
    String name = 'beta';

    if (user != null) {
      // Check if display name exists
      String? displayName = user.displayName;
      String? userEmail = user.email;

      String? userName;
      if (displayName != null) {
        int startIndex = displayName.lastIndexOf('(');
        int endIndex = displayName.lastIndexOf(')');
        if (startIndex != -1 && endIndex != -1 && endIndex > startIndex) {
          userName = displayName.substring(startIndex + 1, endIndex);
        }
      }

      // ignore: unrelated_type_equality_checks
      if (userName == Null && userEmail != null) {
        int index = userEmail.lastIndexOf('@');
        if (index != -1) {
          userName = userEmail.substring(0, index);
        }
      }

      if (userName != null) {
        name = userName;
      }
    }

    return ListView(
      children: [
        Stack(
          children: [
            const Column(
              children: [
                SizedBox(height: 490,),
                MyBackground1(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 600,),
                Container(
                    color: Theme.of(context).primaryColor,
                    height: 570,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'hai $name!',
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'How\'s your day ?',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12))),
                          height: 350,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12))),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          vectorColorex,
                                          height: 48,
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const Text(
                                          'Coming Soon!!',
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'LeagueSpartan',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(12))),
                                height: 80,
                                child: const Center(
                                  child: Text(
                                    'Beta Testing now Open!!',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'LeagueSpartan',
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Container(
                                  width: 140,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 6,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$notif Notifications',
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'LeagueSpartan'),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: <Widget>[
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Only for you!!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'LeagueSpartan',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                             const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Article for You',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'LeagueSpartan',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            MyArticleWidget(),
                            const SizedBox(
                              height: 12,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Outfit of the Day',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'LeagueSpartan',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            MyArticleWidget(),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}