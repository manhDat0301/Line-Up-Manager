import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService._();

  FireStorageService();

  static Future<dynamic> loadFromStorage(
      BuildContext context, String gsUrl) async {
    return await FirebaseStorage.instance
        .getReferenceFromUrl(gsUrl)
        .then((value) => value.getDownloadURL());
  }
}