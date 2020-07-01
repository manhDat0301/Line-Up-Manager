import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:marozi/common/eng_clubs.dart';

class EngClubsViewModel {
  static List<EngClubs> engClubs;

  static Future loadEngClubs() async {
    try {
      engClubs = new List<EngClubs>();
      String jsonString =
          await rootBundle.loadString('assets/json/en.1.clubs.json');
      Map parsedJson = json.decode(jsonString);
      var categoryJson = parsedJson['clubs'] as List;
      for (int i = 0; i < categoryJson.length; i++) {
        engClubs.add(new EngClubs.fromJson(categoryJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}
