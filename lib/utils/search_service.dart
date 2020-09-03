import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Future<QuerySnapshot> searchByName(String searchField) async {
    return FirebaseFirestore.instance
        .collection('Player')
        .where('player_name', isGreaterThanOrEqualTo: searchField)
        .limit(10)
        .get();
  }
}
