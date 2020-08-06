import 'package:flutter/material.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/position/ui/position_portrait.dart';

class Position extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PositionPortrait();
//    return Orientation.portrait == MediaQuery.of(context).orientation
//        ? PositionPortrait()
//        : PositionLandscape();
  }
}