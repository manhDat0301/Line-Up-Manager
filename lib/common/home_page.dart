import 'package:flutter/material.dart';
import 'package:marozi/landscape/mode_landscape.dart';
import 'package:marozi/portrait/mode_portrait.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? ModePortrait()
        : ModeLandscape();
  }
}
