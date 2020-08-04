import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MaroziFirebase {
  static FirebaseAuth mAuth;
  static Firestore firestoreInstance = Firestore.instance;

  getCurrentUser() {
    mAuth = FirebaseAuth.instance;
    mAuth
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

  Future<int> countClubsByLeagueId(String leagueId) async {
    int i = 0;
    await firestoreInstance.collection('Club').getDocuments().then((value) {
      value.documents.forEach((element) {
        if (element.data['league_id'] == leagueId) {
          i++;
        }
      });
    });
    return i;
  }

  Future<int> countPlayersByClubId(String clubId) async {
    int i = 0;
    await firestoreInstance
        .collection('Player')
        .getDocuments()
        .then((value) async {
      value.documents.forEach((element) {
        if (element.data['club_id'] == clubId) {
          i++;
          if (element.data['player_name'] != null)
            print(element.data['player_name']);
        }
      });
    });
    return i;
  }
}
