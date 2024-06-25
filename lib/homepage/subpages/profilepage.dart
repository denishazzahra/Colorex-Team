import 'package:colorex/homepage/subpages/subsubpages/post.dart';
import 'package:colorex/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          profileBanner(context),
          const PostPage(),
        ],
      ),
    );
  }

  Widget profileBanner(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    String? displayName = userDataProvider.displayName;
    String? photoURL = userDataProvider.photoURL;
    String? username = userDataProvider.userName;
    int followerCount = userDataProvider.follower;
    int postCount = userDataProvider.post;
    int reviewCount = userDataProvider.review;
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
                child: Container(
              height: 70,
              color: Theme.of(context).primaryColor,
            ))
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          height: 210,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      bottom: 9, left: 36, right: 36, top: 9),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  child: Column(
                    children: [
                      // Center(
                      //child:
                      SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    (displayName != null)
                                        ? (displayName.length < 11)
                                            ? displayName
                                            : displayName.substring(0, 11)
                                        : 'Beta User',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  (username != null)
                                      ? Text('#$username')
                                      : const Text('#Username'),
                                ]),
                          ],
                        ),
                        //),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            userDataProvider.season,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Text(postCount.toString()),
                              ),
                              const Center(
                                child: Text('postingan'),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                child: Text(reviewCount.toString()),
                              ),
                              const Center(
                                child: Text('ulasan'),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                child: Text(followerCount.toString()),
                              ),
                              const Center(
                                child: Text('pengikut'),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                    border: Border.all(width: 2)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                child: (photoURL!.length > 1)
                    ? FittedBox(
                        fit: BoxFit.contain,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(photoURL),
                        ))
                    : Center(
                        child: Text(
                          photoURL,
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                      )),
          ],
        ),
        Positioned(
            top: 48,
            right: 60,
            height: 32,
            width: 60,
            child: FloatingActionButton(
              onPressed: () {},
              shape: const BeveledRectangleBorder(
                  side: BorderSide(width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: const Text(
                "Edit",
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ))
      ],
    );
  }
}