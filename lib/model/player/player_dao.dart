import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/adding/repository/adding_constants.dart';
import 'package:marozi/utils/database_helpers.dart';
import 'package:sqflite/sqflite.dart';

class PlayerDao {
  DatabaseHelper helper = DatabaseHelper.instance;

  Future<int> createPlayer(Player player) async {
    Database db = await helper.database;

    var result = 0;
    bool isExist = false;

    if (AddingConstants.listPlayers.length == 0) {
      db.insert(tablePlayer, player.toMap());
    } else {
      AddingConstants.listPlayers.forEach((item) {
        if (item.id == player.id) {
          isExist = true;
        } else {
          isExist = false;
        }
      });
      if (!isExist) {
        db.insert(tablePlayer, player.toMap());
        isExist = false;
      }
    }

    return result;
  }

  Future<List<Player>> getAllPlayers() async {
    Database db = await helper.database;

    List<Map<String, dynamic>> result;
    try {
      result = await db.query(tablePlayer);
    } catch (e) {
      print('######################## $e');
    }
    List<Player> listPlayer = result.isNotEmpty
        ? result.map((item) => Player.fromMap(item)).toList()
        : [];
    return listPlayer;
  }

  Future<int> countPlayersByClubId(String clubId) async {
    Database db = await helper.database;
    print('countPlayersByClubId: ${Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT() from $tablePlayer WHERE club_id = \'$clubId\''))}');
    return Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT() from $tablePlayer WHERE club_id = \'$clubId\''));
  }

  Future<List<Player>> getPlayersByClubId(String clubId) async {
    Database db = await helper.database;
    List<Map<String, dynamic>> result;
    result =
        await db.query(tablePlayer, where: 'club_id = ?', whereArgs: [clubId]);
    print('$result');
  }
}
