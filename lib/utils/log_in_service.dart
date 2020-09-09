import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogInService {
  static FirebaseAuth mAuth;
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  getCurrentUser() async {
    mAuth = FirebaseAuth.instance;
    await mAuth
        .signInWithEmailAndPassword(
            email: "marozi@gmail.com", password: "Marozi@123")
        .whenComplete(() async {
      User currentUser = mAuth.currentUser;
      print('currentUser: ${currentUser.email}');
    });
  }
}
