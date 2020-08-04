import 'package:flutter/cupertino.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/club/club_repository.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/model/league/league_repository.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/model/player/player_repository.dart';

class MaroziLocal {
  Future<int> countLeagueLocal() async {
    final leagueRepo = LeagueRepository();

    return await leagueRepo.count();
  }

  Future<int> countClubByLeague({@required League league}) async {
    final clubRepo = ClubRepository();

    int count = await clubRepo.countClubByLeagueId(league: league);

    return count;
  }

  Future<List<Club>> getClubsByLeague(League league) async {
    final clubRepo = ClubRepository();
    return await clubRepo.getClubsByLeague(league: league);
  }

  Future<List<Player>> getPlayersByClub(Club club) async {
    final playerRepo = PlayerRepository();
    return await playerRepo.getPlayersByClub(club: club);
  }

  Future<int> countPlayersByClub({@required Club club}) async {
    final playerRepo = PlayerRepository();
    return await playerRepo.countPlayersByClub(club);
  }

  Future insertLeagueLocal(League league) async {
    final leagueRepo = LeagueRepository();
    await leagueRepo.insertLeague(league);
  }

  Future clearLeagueContent() async {
    final leagueRepo = LeagueRepository();
    leagueRepo.clearContent();
  }

  Future clearClubContent() async {
    final clubRepo = ClubRepository();
    clubRepo.clearContent();
  }
}
