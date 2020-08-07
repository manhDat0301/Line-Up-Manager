import 'package:flutter/material.dart';
import 'package:marozi/portrait/position/ui/position_portrait.dart';
import 'package:marozi/repository/constants.dart';

class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;
    return PositionPortrait();
//    return Orientation.portrait == MediaQuery.of(context).orientation
//        ? PositionPortrait()
//        : PositionLandscape();
  }
}
