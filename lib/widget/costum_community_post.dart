import 'dart:io';

import 'package:colorex/utils/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:colorex/model/post.dart';

class MyCommunityPost extends StatefulWidget {
  const MyCommunityPost({
    super.key,
    required this.postData,
  });
  final MyPostData postData;

  @override
  State<MyCommunityPost> createState() => _MyCommunityPostState();
}

class _MyCommunityPostState extends State<MyCommunityPost> {
  final String chatAsset = "assets/svg/Chat.svg";
  final String bookmarkAsset = "assets/svg/Bookmark.svg";
  final String sendAsset = "assets/svg/Send.svg";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
      ),
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(width: 2)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: (widget.postData.photoURL.length > 1)
                      ? FittedBox(
                          fit: BoxFit.contain,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(widget.postData.photoURL),
                          ))
                      : Center(
                          child: Text(
                            widget.postData.photoURL,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                        )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "@${widget.postData.userName}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "${convertToFloorTime((DateTime.now().millisecondsSinceEpoch - widget.postData.timeStamp) ~/ 1000)} yang lalu",
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${widget.postData.season} | Match 100%",
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'LeagueSpartan',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              // ! add option -------------------------------------------------------------------------<<<<<<<
            ],
          ),
          Visibility(
            visible: widget.postData.caption
                .isNotEmpty, // Show the SizedBox only if caption length is not zero
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  height: 32,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.postData.caption
                          .length, // Number of items in the horizontal list
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(2.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: const Color.fromARGB(255, 234, 234, 234),
                          ),
                          child: Center(
                            child: Text(
                              widget.postData.caption[index],
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontFamily: 'LeagueSpartan',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.postData.contentImage,
            child: Image.network(widget.postData.contentImageURL),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  widget.postData.content,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontFamily: "LeagueSpartan",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // ? ini tuh bagian action ::-------------------------------------------------------- <<<<<<<
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Row(
              children: [
                SizedBox(
                  width: 65,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.favorite_border,
                          size: 23,
                        ),
                      ),
                      Text(
                        widget.postData.like.toString(),
                        style: const TextStyle(
                          fontFamily: "LeagueSpartan",
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          chatAsset,
                          height: 18,
                        ),
                      ),
                      Text(
                        widget.postData.comment.toString(),
                        style: const TextStyle(
                          fontFamily: "LeagueSpartan",
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          bookmarkAsset,
                          height: 18,
                        ),
                      ),
                      Text(
                        widget.postData.bookmark.toString(),
                        style: const TextStyle(
                          fontFamily: "LeagueSpartan",
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SvgPicture.asset(
                    sendAsset,
                    height: 18,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
