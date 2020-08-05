import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MaroziFirebase {
  static FirebaseAuth mAuth;
  static Firestore firestoreInstance = Firestore.instance;

  getCurrentUser() async {
    mAuth = FirebaseAuth.instance;
    await mAuth
        .signInWithEmailAndPassword(
            email: "marozi@gmail.com", password: "Marozi@123")
        .whenComplete(() async {
      FirebaseUser currentUser = await mAuth.currentUser();
      print('currentUser: ${currentUser.email}');
    });
  }

  Future<int> countLeagueFirebase() async {
    var i = await firestoreInstance
        .collection('League')
        .getDocuments()
        .then((value) => value.documents.length);
    return i;
  }
}
