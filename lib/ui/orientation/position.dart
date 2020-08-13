import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/ui/landscape/position/landscape_position.dart';
import 'package:marozi/ui/portrait/position/portrait_position.dart';

class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.width = MediaQuery.of(context).size.width;
    Constants.height = MediaQuery.of(context).size.height;

    return Orientation.portrait == MediaQuery.of(context).orientation
        ? PortraitPosition()
        : LandscapePosition();
  }
}
