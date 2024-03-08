// ignore_for_file: avoid_print, prefer_final_fields, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpwithEmailPass(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Some Error Occured");
    }
    return null;
  }

  Future<User?> logInWithEmailPass(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print("Some Error Occured");
    }
    return null;
  }
}
