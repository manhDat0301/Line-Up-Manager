import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:marozi/landscape/select_mode.dart';
import 'package:marozi/portrait/select_mode.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/data/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _orientation(context);
  }

  Widget _orientation(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<Data>(context, listen: false).orientation(true);
      });
      return ModePortrait();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<Data>(context, listen: false).orientation(false);
      });
      return ModeLandscape();
    }
  }
}
