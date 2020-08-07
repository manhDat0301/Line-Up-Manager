import 'package:flutter/material.dart';
import 'package:marozi/portrait/mode/ui/mode_portrait.dart';
import 'package:marozi/repository/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;
    return ModePortrait();
//    Orientation orientation = MediaQuery.of(context).orientation;
//    return orientation == Orientation.portrait
//        ? ModePortrait()
//        : ModeLandscape();
  }
}
