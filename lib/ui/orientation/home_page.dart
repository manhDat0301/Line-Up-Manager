import 'package:flutter/material.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/ui/landscape/homepage/home_page_landscape.dart';
import 'package:marozi/ui/portrait/homepage/home_page_portrait.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? HomePagePortrait()
        : HomePageLandscape();
  }
}
