import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:marozi/home/select_mode.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _orientation(context));
  }

  Widget _orientation(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {});
      return SelectMode();
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {});
      return SelectMode();
    }
  }
}
