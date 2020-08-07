import 'package:flutter/material.dart';
import 'package:marozi/ui/landscape/position/export_landscape.dart';
import 'package:marozi/ui/portrait/export/export_portrait.dart';

class Export extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? ExportPortrait()
        : ExportLandscape();
  }
}
