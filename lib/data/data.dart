import 'package:flutter/material.dart';
import 'package:marozi/players/player.dart';

import 'constants.dart';

class Data with ChangeNotifier {
  List<Player> listPlayers;
  List<Widget> listFormationLands;
  List<Widget> listFormationPort;
  List<String> listTypeFormation;
  List<String> listStyle;
  int p2;
  int carouselPageIndex = 0;

  Data() {
    listPlayers = Constants.initPlayersList(listPlayers);

    listFormationLands = Constants.initFormationLandscape(listFormationLands);

    listFormationPort = Constants.initFormationPortrait(listFormationPort);

    listTypeFormation = Constants.initTypeFormation(listTypeFormation);

    listStyle = Constants.initStyle(listStyle);
  }

  playerTarget(int player2) {
    p2 = player2;
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

  switchOrientation(bool isPortrait) {
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
