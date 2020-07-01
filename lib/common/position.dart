import 'package:flutter/cupertino.dart';
import 'package:marozi/landscape/position_landscape.dart';
import 'package:marozi/portrait/position/ui/position_portrait.dart';

class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Orientation.portrait == MediaQuery.of(context).orientation
        ? PositionPortrait()
        : PositionLandscape();
  }
}
