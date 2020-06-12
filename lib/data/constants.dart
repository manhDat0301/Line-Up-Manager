import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marozi/landscape/4_3_3.dart';
import 'package:marozi/players/player.dart';
import 'package:marozi/portrait/4_3_3.dart';

import '../resources/strings.dart';

class Constants {
  // Xiaomi A6
  static double widthPortrait = 360;
  static double heightPortrait = 720.0 - 30.0;

  // Pixel 2
//  static double widthPortrait = 411.42857142857144;
//  static double heightPortrait = 683.4285714285714 - 30.0;

  // Pixel 3 XL
//  static double widthPortrait = 411.42857142857144;
//  static double heightPortrait = 797.7142857142857 - 30.0;

  static double halfPlayerHeight = 36.5;
  static double halfPlayerWidth = 32.5;

  static double portraitW(double per) {
    return widthPortrait * per / 100 - halfPlayerWidth;
  }

  static double portraitH(double per) {
    return heightPortrait * per / 100;
  }

  static double landscapeW(double per) {
    return heightPortrait * per / 100 - halfPlayerWidth;
  }

  static double landscapeH(double per) {
    return widthPortrait * per / 100;
  }

  static Map<String, Offset> offsetPortrait = {
    'Martial': Offset(portraitW(50), portraitH(3)),
    'Bruno': Offset(portraitW(50), portraitH(18)),
    'Rashford': Offset(portraitW(20), portraitH(18)),
    'Greenwood': Offset(portraitW(78), portraitH(18)),
    'Pogba': Offset(portraitW(36), portraitH(35)),
    'McTominay': Offset(portraitW(62), portraitH(35)),
    'Wan-bisaka': Offset(portraitW(86), portraitH(48)),
    'Shaw': Offset(portraitW(12), portraitH(48)),
    'Bailly': Offset(portraitW(61), portraitH(52)),
    'Maguire': Offset(portraitW(37), portraitH(52)),
    'De Gea': Offset(portraitW(50), portraitH(67)),
    'LS': Offset(portraitW(20), portraitH(3)),
    'RS': Offset(portraitW(78), portraitH(3)),
    'LDM': Offset(portraitW(12), portraitH(35)),
    'RDM': Offset(portraitW(86), portraitH(35)),
  };

  static Map<String, Offset> offsetLandscape = {
    'Martial': Offset(landscapeW(41.45), landscapeH(0.2)),
    'Bruno': Offset(landscapeW(41.45), landscapeH(21.5)),
    'Rashford': Offset(landscapeW(15), landscapeH(21.5)),
    'Greenwood': Offset(landscapeW(68.85), landscapeH(21.5)),
    'Pogba': Offset(landscapeW(28), landscapeH(39.5)),
    'McTominay': Offset(landscapeW(55.3), landscapeH(39.5)),
    'Wan-bisaka': Offset(landscapeW(74.85), landscapeH(61)),
    'Shaw': Offset(landscapeW(10), landscapeH(61)),
    'Bailly': Offset(landscapeW(58), landscapeH(61)),
    'Maguire': Offset(landscapeW(24.7), landscapeH(61)),
    'De Gea': Offset(landscapeW(41.45), landscapeH(63.3)),
  };

  static List<Player> initPlayersList(List<Player> list) {
    list = [
      Player(
          'Martial', playerAnthonyMartial, Offset(portraitW(50), portraitH(3))),
      Player(
          'Bruno', playerBrunoFernandes, Offset(portraitW(50), portraitH(18))),
      Player('Rashford', playerMarcusRashford,
          Offset(portraitW(20), portraitH(18))),
      Player('Greenwood', playerMasonGreenwood,
          Offset(portraitW(78), portraitH(18))),
      Player('Pogba', playerPaulPogba1, Offset(portraitW(36), portraitH(35))),
      Player('McTominay', playerScottMcTominay,
          Offset(portraitW(62), portraitH(35))),
      Player('Wan-bisaka', playerAaronWanBissaka,
          Offset(portraitW(86), portraitH(48))),
      Player('Shaw', playerLukeShaw, Offset(portraitW(12), portraitH(48))),
      Player('Bailly', playerEricBailly1, Offset(portraitW(61), portraitH(52))),
      Player(
          'Maguire', playerHarryMaguire1, Offset(portraitW(37), portraitH(52))),
      Player('De Gea', playerDeGea1, Offset(portraitW(50), portraitH(67))),

      Player('LDM', null, Offset(portraitW(20), portraitH(3))),
      Player('RDM', null, Offset(portraitW(78), portraitH(3))),
      Player('LS', null, Offset(portraitW(12), portraitH(35))),
      Player('RS', null, Offset(portraitW(86), portraitH(35))),
    ];

    return list;
  }

  static List<Widget> initFormationPortrait(List<Widget> list) {
    return list = [
      Portrait433(),
      Portrait433(),
      Portrait433(),
      Portrait433(),
      Portrait433(),
      Portrait433(),
    ];
  }

  static List<Widget> initFormationLandscape(List<Widget> list) {
    return list = [
      Landscape433(),
      Landscape433(),
      Landscape433(),
      Landscape433(),
      Landscape433(),
      Landscape433(),
    ];
  }

  static List<String> initTypeFormation(List<String> list) {
    return list = ['4-3-3', '4-2-3-1', '4-4-2', '3-4-3', '3-2-2-3', '3-3-3-1'];
  }
  static List<String> initStyle(List<String> list) {
    return list = ['Braven', 'Glory Red', 'B&W', 'The Bleu', 'Royal White', 'Red Devils'];
  }
}
