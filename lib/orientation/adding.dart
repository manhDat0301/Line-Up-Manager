import 'package:flutter/material.dart';
import 'package:marozi/portrait/adding/ui/adding_portrait.dart';

class Adding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AddingPortrait();
//    Orientation orientation = MediaQuery.of(context).orientation;
//    return orientation == Orientation.portrait
//        ? AddingPortrait()
//        : AddingLandscape();
  }
}
