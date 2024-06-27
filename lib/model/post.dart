import 'dart:convert';
import 'package:colorex/model/user.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPostData {
  MyPostData(BuildContext context, Map<String, dynamic> data) {
    postID = hashAnything(data);
    timeStamp = DateTime.now().millisecondsSinceEpoch;

    MyUserData userDataProvider =
        Provider.of<MyUserData>(context, listen: false);
    caption = extractCaptions(data["Content"]);
    userID = userDataProvider.userID!;
    userName = userDataProvider.userName!;
    photoURL = userDataProvider.photoURL!;
    season = userDataProvider.season;

    content = data["Content"];
    contentImageURL = data["includeImage"] ? data["Content_Image_URL"] : '';
    contentLinkURL = data["includeLink"] ? data["Content_Link_URL"] : '';

    contentImage = data["includeImage"];
    contentLink = data["includeLink"];
  }

  String postID = '';
  String userID = '';
  int timeStamp = 0;

  String userName = '';
  String season = '';
  String photoURL = '';

  String content = '';

  bool contentImage = false;
  String contentImageURL = '';

  bool contentLink = false;
  String contentLinkURL = '';

  int like = 0;
  int bookmark = 0;
  int comment = 0;

  bool isLiked = false;
  bool isBookmarked = false;
  bool isCommented = false;

  List<DocumentReference> commentList = [];
  List<String> caption = [];

  // ? awal dari para fungsi ---------------------------------------------------------------- <<<<<<
  Map<String, dynamic> toMap() {
    return {
      'Post_ID': postID,
      'User_ID': userID,
      'Time_Stamp': timeStamp,
      'UserName': userName,
      'Season': season,
      'Photo_URL': photoURL,
      'Content': content,
      'Content_Image': contentImage,
      'Content_Image_URL': contentImageURL,
      'Content_Link': contentLink,
      'Content_Link_URL': contentLinkURL,
      'Like': like,
      'Bookmark': bookmark,
      'Comment': comment,
      'Comment_List': commentList.map((comment) => comment.path).toList(),
      'Caption': caption,
    };
  }

  List<String> extractCaptions(String mainString) {
    List<String> substrings = [];

    // Regular expression pattern to match substrings starting with '#' and ending with space
    RegExp regex = RegExp(r'#\S+');

    // Iterate through the matches and add them to the list
    for (RegExpMatch match in regex.allMatches(mainString)) {
      substrings.add(match.group(0)!);
    }

    return substrings;
  }

  String hashAnything(dynamic input) {
    // Convert the input to a string representation
    String inputString;
    if (input is String) {
      inputString = input;
    } else if (input is List<int>) {
      inputString = utf8.decode(input);
    } else {
      inputString = input.toString();
    }

    // Calculate the MD5 hash
    var bytes = utf8.encode(inputString);
    var md5Hash = md5.convert(bytes);

    // Return the hash as a hexadecimal string
    return md5Hash.toString();
  }

  void increaseLike() async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Post').doc(postID);
      await documentReference.update({
        'Like': FieldValue.increment(1),
      });
      like += 1;
    } catch (e) {
      if (kDebugMode) {
        print('Error incrementing data: $e');
      }
    }
  }

  void decreaseLike() async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Post').doc(postID);
      await documentReference.update({
        'Like': FieldValue.increment(-1),
      });
      like -= 1;
    } catch (e) {
      if (kDebugMode) {
        print('Error incrementing data: $e');
      }
    }
  }

  void increaseBookmark() async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Post').doc(postID);
      await documentReference.update({
        'Bookmark': FieldValue.increment(1),
      });
      bookmark += 1;
    } catch (e) {
      if (kDebugMode) {
        print('Error incrementing data: $e');
      }
    }
  }

  void decreaseBookmark() async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Post').doc(postID);
      await documentReference.update({
        'Bookmark': FieldValue.increment(-1),
      });
      bookmark -= 1;
    } catch (e) {
      if (kDebugMode) {
        print('Error incrementing data: $e');
      }
    }
  }

  void increaseComment() async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Post').doc(postID);
      await documentReference.update({
        'Comment': FieldValue.increment(1),
      });
      comment += 1;
    } catch (e) {
      if (kDebugMode) {
        print('Error incrementing data: $e');
      }
    }
  }

  void decreaseComment() async {
    try {
      DocumentReference documentReference =
          FirebaseFirestore.instance.collection('Post').doc(postID);
      await documentReference.update({
        'Comment': FieldValue.increment(-1),
      });
      comment -= 1;
    } catch (e) {
      if (kDebugMode) {
        print('Error incrementing data: $e');
      }
    }
  }
}

class MyPostDataManager extends ChangeNotifier {
  List<MyPostData> profilePost = [];
  List<MyPostData> communityPost = [];
  List<MyPostData> bookmarkPost = [];

  void adddata(MyPostData data) {
    communityPost = [data, ...communityPost];
    notifyListeners();
  }
}
