import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

Future<void> addUserData(Map<String, dynamic> data, String document) async {

  CollectionReference users = FirebaseFirestore.instance.collection('User');
  await users.doc(document).set(data);
}

Future<Map<String, dynamic>?> getDataFromFirestore(String collectionName, String documentId) async {
  try {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection(collectionName).doc(documentId).get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    } else {
      // Document does not exist
      return null;
    }
  } catch (e) {
    // Error fetching data
    if (kDebugMode) {
      print('Error fetching data: $e');
    }
    return null;
  }
}
