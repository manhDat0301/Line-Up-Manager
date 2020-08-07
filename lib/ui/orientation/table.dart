import 'package:flutter/material.dart';
import 'package:marozi/ui/landscape/table/table_landscape.dart';
import 'package:marozi/ui/portrait/table/table_portrait.dart';

class PlayerTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? PlayerTablePortrait()
        : PlayerTableLandscape();
  }
}