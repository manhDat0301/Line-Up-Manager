import 'package:marozi/model/player/player.dart';
import 'package:marozi/ui/example/test.dart';

class TestObj {
  String id;
  String name;

  TestObj({this.id, this.name});

  TestObj.fromMap(Map<String, dynamic> map) {
    id = map[playerId];
    name = map[playerName];
  }

  Map<String, dynamic> toMap() {
    var map = {
      playerId : id,
      playerName : name,
    };
    return map;
  }
}