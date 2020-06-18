import 'package:flutter/material.dart';
import 'package:marozi/landscape/export_landscape.dart';
import 'package:marozi/portrait/export_portrait.dart';

class Export extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? ExportPortrait()
        : ExportLandscape();
  }
}
