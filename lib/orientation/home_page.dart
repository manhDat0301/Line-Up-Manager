import 'package:flutter/material.dart';
import 'package:marozi/portrait/mode/ui/mode_portrait.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModePortrait();
//    Orientation orientation = MediaQuery.of(context).orientation;
//    return orientation == Orientation.portrait
//        ? ModePortrait()
//        : ModeLandscape();
  }
}
