import 'package:flutter/material.dart';
import 'package:marozi/landscape/adding_landscape.dart';
import 'package:marozi/portrait/adding_portrait.dart';

class Adding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? AddingPortrait()
        : AddingLandscape();
  }
}
