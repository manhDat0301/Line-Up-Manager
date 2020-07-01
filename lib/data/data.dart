import 'package:flutter/material.dart';
import 'package:marozi/players/player.dart';

import '../portrait/position/repositories/constants.dart';

class Data with ChangeNotifier {
  List<Player> listPlayers;
  List<Widget> listFormationLands;
  List<Widget> listFormationPort;
  List<String> listTypeFormation;
  List<String> listStyle;
  List<String> listPremierLeague;
  List<String> listManUPlayers;
  int p2;
  int carouselPageIndex = 0;
  String teamSelected;

  Data() {

    listFormationLands = Constants.initFormationLandscape(listFormationLands);


    listStyle = Constants.initStyle(listStyle);

    listPremierLeague = Constants.initPremierLeague(listPremierLeague);

    listManUPlayers = Constants.initManUnitedPlayers(listManUPlayers);

    listManUPlayers.sort();
  }

  playerTarget(int player2) {
    p2 = player2;
  }

  teamSelect(String team) {
    teamSelected = team;
    notifyListeners();
  }

  swapPlayersPortrait(int p1) {
    Offset temp = listPlayers[p1].offset;
    listPlayers[p1].offset = listPlayers[p2].offset;
    listPlayers[p2].offset = temp;

    Offset tempP = Constants.offsetPortrait[listPlayers[p1].name];
    Constants.offsetPortrait[listPlayers[p1].name] =
        Constants.offsetPortrait[listPlayers[p2].name];
    Constants.offsetPortrait[listPlayers[p2].name] = tempP;

    Offset tempL = Constants.offsetLandscape[listPlayers[p1].name];
    Constants.offsetLandscape[listPlayers[p1].name] =
        Constants.offsetLandscape[listPlayers[p2].name];
    Constants.offsetLandscape[listPlayers[p2].name] = tempL;

    notifyListeners();
  }

  setCarouselPageIndex(int i) {
    carouselPageIndex = i;
    notifyListeners();
  }

  orientation(bool isPortrait) {
    if (isPortrait) {
      for (int i = 0; i < listPlayers.length; i++) {
        listPlayers[i].offset = Constants.offsetPortrait[listPlayers[i].name];
      }
    } else {
      for (int i = 0; i < listPlayers.length; i++) {
        listPlayers[i].offset = Constants.offsetLandscape[listPlayers[i].name];
      }
    }
    notifyListeners();
  }

}
