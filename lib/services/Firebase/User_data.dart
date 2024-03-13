// ignore_for_file: file_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> fetchUsername() async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('users')
          .limit(1) // Fetch only the first document
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        return documentSnapshot.get('username');
      }
    } catch (e) {
      print('Error fetching username: $e');
    }
    return null;
  }
}
