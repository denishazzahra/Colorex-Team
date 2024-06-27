import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../model/user.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late List<Map<String, dynamic>> reviews;
  late String? photoURL, username, season;
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<MyUserData>(context);
    photoURL = userDataProvider.photoURL;
    username = userDataProvider.userName;
    season = userDataProvider.season;
    loadData();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: reviews.asMap().values.map((review) {
          return reviewThumbnail(
            review['reviewId'],
            review['time'],
            review['tags'],
            review['content'],
            review['likeCount'],
            review['commentCount'],
            review['bookmarkCount'],
          );
        }).toList(),
      ),
    );
  }

  void loadData() {
    Map<String, dynamic> exampleReview = {
      'reviewId': 'xxxxx',
      'time': '1 jam yang lalu',
      'tags': ['Look so nice', 'The colors are pretty', 'I like it'],
      'content':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam molestie hendrerit nulla, egestas tempus neque fringilla ut. Vivamus et tempus diam. Praesent luctus lectus id erat vehicula viverra. Aliquam nec magna ex. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
      'likeCount': 120,
      'commentCount': 200,
      'bookmarkCount': 50,
    };
    reviews = List.filled(5, exampleReview);
  }

  Widget reviewThumbnail(String reviewId, String time, List<String> tags,
      String content, int likeCount, int commentCount, int bookmarkCount) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
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
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userDisplay(time, season!, '100%'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                iconSize: 20,
                splashRadius: 20,
                visualDensity: VisualDensity.compact,
              )
            ],
          ),
          const SizedBox(height: 16),
          tagsDisplay(tags),
          const SizedBox(height: 16),
          Text(
            content,
            style: const TextStyle(
                fontSize: 18, fontFamily: 'LeagueSpartan', height: 1.15),
          ),
          const SizedBox(height: 16),
          engagementDisplay(likeCount, commentCount, bookmarkCount)
        ],
      ),
    );
  }

  Widget userDisplay(String time, String season, String match) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 1.5),
            ),
            child: CircleAvatar(
              radius: 48, // Adjust the radius to fit your design
              backgroundColor: Colors.grey, // Grey background during loading
              child: ClipOval(
                child: Image.network(
                  photoURL!,
                  fit: BoxFit.cover,
                  width: 96, // Size matching the CircleAvatar's diameter
                  height: 96, // Size matching the CircleAvatar's diameter
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Return the image once it's fully loaded
                    } else {
                      return Container(
                        width: 96,
                        height: 96,
                        color: Colors.grey, // Grey background during loading
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Container(
                      width: 96,
                      height: 96,
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
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  bigBoldText('@$username'),
                  const SizedBox(
                    width: 16,
                  ),
                  smallText(time)
                ],
              ),
              Text(
                '$season | Match $match',
                style:
                    const TextStyle(fontFamily: 'LeagueSpartan', fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }

  Text bigBoldText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'LeagueSpartan',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      ),
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

  Widget tagsDisplay(List<String> tags) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: tags.asMap().values.map((tag) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          child: smallText(tag),
        );
      }).toList(),
    );
  }

  Widget engagementDisplay(int likeCount, int commentCount, int bookmarkCount) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              color: Color(0xFF3C3C3C),
              size: 24,
            ),
            const SizedBox(width: 2),
            Text(
              likeCount.toString(),
              style: const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 16,
                color: Color(0xFF3C3C3C),
              ),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(
              'assets/svg/Chat.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xFF3C3C3C), BlendMode.srcIn),
              height: 20,
              width: 24,
            ),
            const SizedBox(width: 2),
            Text(
              commentCount.toString(),
              style: const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 16,
                color: Color(0xFF3C3C3C),
              ),
            ),
            const SizedBox(width: 16),
            const Icon(
              Icons.bookmark_outline,
              color: Color(0xFF3C3C3C),
              size: 24,
            ),
            const SizedBox(width: 2),
            Text(
              bookmarkCount.toString(),
              style: const TextStyle(
                fontFamily: 'LeagueSpartan',
                fontSize: 16,
                color: Color(0xFF3C3C3C),
              ),
            )
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/svg/Send.svg',
            fit: BoxFit.contain,
            colorFilter:
                const ColorFilter.mode(Color(0xFF3C3C3C), BlendMode.srcIn),
            height: 20,
            width: 24,
          ),
        )
      ],
    );
  }
}
