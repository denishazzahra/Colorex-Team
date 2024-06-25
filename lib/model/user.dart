import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyUserData extends ChangeNotifier {
  String? userID;
  String? userName;
  String? displayName;
  String? photoURL;
  String season = 'Your season';
  
  int follower = 0;
  int post = 0;
  int review = 0;

  List<DocumentReference> followerList = [];
  List<DocumentReference> postList = [];
  List<DocumentReference> reviewList = [];
  List<DocumentReference> bookmark = [];

  void loadUserData(Map<String, dynamic> userData) {
    userID = userData['User_ID'] ?? userID;
    userName = userData['Username'] ?? userName;
    displayName = userData['Display_Name'] ?? displayName;
    photoURL = userData['Photo_URL'] ?? photoURL;
    season = userData['Season'] ?? season;

    follower = userData['Follower'] ?? follower;
    post = userData['Post'] ?? post;
    review = userData['Review'] ?? review;

    followerList = userData['Follower_List'] ?? followerList;
    postList = userData['Post_List'] ?? postList;
    reviewList = userData['Review_List'] ?? reviewList;
    bookmark = userData['Bookmark'] ?? bookmark;

    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    return {
      'User_ID': userID,
      'Username': userName,
      'Display_Name': displayName,
      'Photo_URL': photoURL,
      'Season': season,
      'Follower': follower,
      'Post': post,
      'Review': review,
      'Follower_List': followerList.map((ref) => ref.id).toList(),
      'Post_List': postList.map((ref) => ref.id).toList(),
      'Review_List': reviewList.map((ref) => ref.id).toList(),
      'Bookmark': bookmark.map((ref) => ref.id).toList(),
    };
  }
}
