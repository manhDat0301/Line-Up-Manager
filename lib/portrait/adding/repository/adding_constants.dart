import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/model/player/player.dart';

class AddingConstants {
  static bool isFavouriteExpand = false;
  static bool isTeamExpand = false;
  static int key;

  static Map<String, List<League>> leagueByNation = Map();
  static Map<String, List<Club>> clubByLeague = Map();

  static List<Club> listClubs = [];
  static List<League> listLeagues = [];
  static List<Player> listPlayers = [];

}