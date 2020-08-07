import 'package:flutter/material.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/ui/landscape/position/position_landscape.dart';
import 'package:marozi/ui/portrait/position/position_portrait.dart';

class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;
    return Orientation.portrait == MediaQuery.of(context).orientation
        ? PositionPortrait()
        : PositionLandscape();
  }
}
