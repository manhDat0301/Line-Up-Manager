import 'package:flutter/material.dart';
import 'package:marozi/portrait/table/ui/table_portrait.dart';

class PlayerTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return PlayerTablePortrait();
//    return orientation == Orientation.portrait
//        ? PlayerTablePortrait()
//        : PlayerTableLandscape();
  }
}