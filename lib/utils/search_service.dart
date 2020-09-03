import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Future<QuerySnapshot> searchByName(String searchField) async {
    var docs = FirebaseFirestore.instance
        .collection('Player')
        .where('player_name', isGreaterThanOrEqualTo: searchField)
        .where("player_name", isLessThan: searchField + 'z')
        .limit(20)
        .get();
    docs.then((value) => value.docs.forEach((element) {
        }));

    return FirebaseFirestore.instance
        .collection('Player')
        .where('player_name', isGreaterThanOrEqualTo: searchField)
        .where("player_name", isLessThan: searchField + 'z')
        .limit(20)
        .get();
  }
}
