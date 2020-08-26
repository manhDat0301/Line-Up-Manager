import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireStorageService extends ChangeNotifier {
  FireStorageService._();

  FireStorageService();

  static Future<dynamic> loadImage(BuildContext context, String gsUrl) async {
    return gsUrl != null
        ? await FirebaseStorage.instance
            .getReferenceFromUrl(gsUrl)
            .then((value) => value.getDownloadURL())
        : '';
  }
}
