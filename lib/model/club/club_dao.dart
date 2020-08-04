import 'package:flutter/cupertino.dart';
import 'package:marozi/utils/database_helpers.dart';
import 'package:sqflite/sqflite.dart';

import 'club.dart';

class ClubDao {
  final helper = DatabaseHelper.instance;

  Future<int> createClub(Club club) async {
    final db = await helper.database;

    var result = 0;

    bool isExists = false;

    List<Club> listClub = await getClubsByLeagueId(leagueId: club.leagueId);

    if (listClub.length > 0) {
      listClub.forEach((item) {
        if (item.id == club.id) {
          isExists = true;
        }
      });
    }

    if (!isExists && club.id != null) {
      result = await db.insert(tableClubs, club.toMap());
    }
    return result;
  }

  Future<int> countClubByLeagueId(String leagueId) async {
    final db = await helper.database;
    return Sqflite.firstIntValue(await db.rawQuery(
        'SELECT COUNT(*) from $tableClubs WHERE league_id = \'$leagueId\''));
  }

  Future<List<Club>> getClubsByLeagueId({@required String leagueId}) async {
    final db = await helper.database;

    List<Map<String, dynamic>> result;
    result = await db.query(
      tableClubs,
      where: 'league_id = ?',
      whereArgs: ['$leagueId'],
    );

    List<Club> clubs =
        result.isNotEmpty ? result.map((e) => Club.fromMap(e)).toList() : [];
    return clubs;
  }

  Future<List<Club>> getAllClubs() async {
    final db = await helper.database;

    List<Map<String, dynamic>> result;

    result = await db.query(tableClubs);

    List<Club> clubs =
        result.isNotEmpty ? result.map((e) => Club.fromMap(e)).toList() : [];

    return clubs;
  }

  Future<int> updateClub(Club club) async {
    final db = await helper.database;

    var result = db.update(tableClubs, club.toMap());
    return result;
  }

  Future clearContent() async {
    final db = await helper.database;

    db.execute('DELETE FROM $tableClubs');
  }

  Future<int> deleteTodo(Club club) async {
    final db = await helper.database;

    return await db
        .delete(tableClubs, where: 'id = ?', whereArgs: ['${club.id}']);
  }
}
