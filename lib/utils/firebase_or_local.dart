import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/club/club_repository.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/model/league/league_repository.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/utils/firebase.dart';
import 'package:marozi/utils/local.dart';


class FirebaseOrLocal {
  static final _maroziFirebase = MaroziFirebase();
  static final _maroziLocal = MaroziLocal();
  static final _firestoreInstance = Firestore.instance;

  static splashDataLoading() async {
    _maroziFirebase.getCurrentUser();
    if (await _leagueNeedUpdate()) {
      _localUpdateAllLeague();
    }
  }

  Future<Map<String, List<League>>> getLeagueByNation() async {
    Map<String, List<League>> result = Map();
    final leagueRepo = LeagueRepository();

    if (await _leagueNeedUpdate()) {
      _localUpdateAllLeague();
      _firestoreInstance.collection('League').getDocuments().then((value) {
        value.documents.forEach((element) {
          result[element.data['league_nation']] = [];
        });

        result.keys.forEach((key) {
          value.documents.forEach((element) {
            if (element.data['league_nation'] == key &&
                element.data['league_nation'] != null) {
              League league = League();
              league.id = element.documentID;
              league.name = element.data['league_name'];
              league.nation = element.data['league_nation'];
              league.logUrl = element.data['league_logo_url'];
              league.isExpand = false;
              result[key].add(league);
            }
          });
        });
      });
      return result;
    }
    result = await leagueRepo.getLeagueByNation();
    return result;
  }

  Future<List<Club>> getClubsByLeague(League league) async {

    int local = await _maroziLocal.countClubByLeague(league: league);
    int firebase = await _maroziFirebase.countClubsByLeagueId(league.id);

    List<Club> clubs = [];
    if (local != 0) {
      clubs = await _maroziLocal.getClubsByLeague(league);
    }
    if (local == 0 || local != firebase) {
      clubs = await _localUpdateClubsByLeague(league);
    }
    return clubs;
  }

  Future<List<Player>> getPlayersByClub(Club club) async {
    int local = await _maroziLocal.countPlayersByClub(club: club);
    int firebase = await _maroziFirebase.countPlayersByClubId(club.id);

    print('local $local firebase $firebase');

    List<Player> players = [];

//    print('local $local firebase $firebase');
//    if (local != 0) {
//      players = await _maroziLocal.getPlayersByClub(club);
//    }
//    if (local == 0 || local != firebase) {
////      players = await _localUpdateClubsByLeague(league);
//    }
    return players;
  }

  static _localUpdateAllLeague() async {
    await _maroziLocal.clearLeagueContent();
    _firestoreInstance.collection('League').getDocuments().then((value) {
      value.documents.forEach((element) {
        League league = League();
        league.id = element.documentID;
        league.name = element.data['league_name'];
        league.nation = element.data['league_nation'];
        league.logUrl = element.data['league_logo_url'];
        league.isExpand = false;
        _maroziLocal.insertLeagueLocal(league);
      });
    });
  }

  static Future<bool> _leagueNeedUpdate() async {
    int firebase = await _maroziFirebase.countLeagueFirebase();
    int local = await _maroziLocal.countLeagueLocal();
    return (local == 0 || local != firebase);
  }

  Future<List<Club>> _localUpdateClubsByLeague(League league) async {
    final clubRepo = ClubRepository();
    List<Club> clubs = [];
    _firestoreInstance.collection('Club').getDocuments().then((value) {
      value.documents.forEach((element) {
        if (element.data['league_id'] == league.id) {
          Club club = Club();
          club.id = element.documentID;
          club.name = element.data['club_name'];
          club.leagueId = element.data['league_id'];
          club.leagueName = element.data['league_name'];
          club.logoUrl = element.data['club_logo_url'];
          club.isExpand = false;
          clubRepo.insertClub(club);
          clubs.add(club);
        }
      });
    });
    return clubs;
  }
}
