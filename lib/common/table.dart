import 'package:flutter/cupertino.dart';
import 'package:marozi/landscape/table_landscape.dart';
import 'package:marozi/portrait/table_portrait.dart';

class PlayerTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? PlayerTablePortrait()
        : PlayerTableLandscape();
  }
}