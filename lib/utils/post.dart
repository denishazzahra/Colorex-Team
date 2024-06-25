import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/foundation.dart';

Future<void> addNewPost(Map<String, dynamic> data, String document) async {

  CollectionReference users = FirebaseFirestore.instance.collection('Post');
  await users.doc(document).set(data);
}

String convertToFloorTime(int seconds) {
  if (seconds < 60) {
    return '$seconds Detik';
  } else if (seconds < 3600) {
    int minutes = seconds ~/ 60;
    return '$minutes Menit';
  } else if (seconds < 86400) {
    int hours = seconds ~/ 3600;
    return '$hours Jam';
  } else {
    int days = seconds ~/ 86400;
    return '$days Hari';
  }
}