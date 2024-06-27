import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late double postDimension;
  late List<Map<String, dynamic>> posts;
  late MyUserData userDataProvider;
  late String? photoURL;
  late String? username;

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    photoURL = userDataProvider.photoURL;
    username = userDataProvider.userName;
    postDimension = (MediaQuery.of(context).size.width - 60) / 2;
    loadData();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: posts.asMap().values.map((post) {
          return postThumbnail(post['imgUrl'], post['caption'],
              post['likeCount'], post['postId']);
        }).toList(),
      ),
    );
  }

  Widget postThumbnail(
      String imgUrl, String caption, int likeCount, String postId) {
    return Container(
      width: postDimension,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 4, // Blur radius
              offset: const Offset(0, 3), // Shadow offset (x, y)
            ),
          ]),
      child: InkWell(
        onTap: () {
          onTap(postId);
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Container(color: Theme.of(context).cardColor);
                    }
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Theme.of(context).cardColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                children: [
                  captionDisplay(caption),
                  const SizedBox(height: 4),
                  Row(
                    children: [userDisplay(), likeDisplay(likeCount)],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget captionDisplay(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  void loadData() {
    Map<String, dynamic> examplePost = {
      'postId': 'xxxxx',
      'imgUrl':
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSAOnLXSaPbc4K0IId0dSTI050OfwusYAyfQzMiCF6mrwNPVdmN',
      'caption': 'tes caption overflow',
      'likeCount': 120
    };
    posts = List.filled(5, examplePost);
  }

  Widget userDisplay() {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: CircleAvatar(
              radius: 24, // Adjust the radius to fit your design
              backgroundColor: Colors.grey, // Grey background during loading
              child: ClipOval(
                child: Image.network(
                  photoURL!,
                  fit: BoxFit.cover,
                  width: 48, // Size matching the CircleAvatar's diameter
                  height: 48, // Size matching the CircleAvatar's diameter
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Return the image once it's fully loaded
                    } else {
                      return Container(
                        width: 48,
                        height: 48,
                        color: Colors.grey, // Grey background during loading
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      color: Theme.of(context)
                          .cardColor, // Fallback to card color on error
                      child: Text(
                        photoURL!,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          smallText('@$username')
        ],
      ),
    );
  }

  Widget likeDisplay(int likeCount) {
    return Row(
      children: [
        const Icon(
          Icons.favorite_border,
          color: Color(0xFF3C3C3C),
          size: 18,
        ),
        const SizedBox(width: 2),
        smallText(likeCount.toString())
      ],
    );
  }

  Text smallText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'LeagueSpartan',
        color: Color(0xFF3C3C3C),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  void onTap(String postId) {
    //masuk ke detail post
  }
}
