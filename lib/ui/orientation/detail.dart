import 'package:flutter/material.dart';
import 'package:marozi/ui/landscape/detail/landscape_detail.dart';
import 'package:marozi/ui/portrait/detail/portrait_detail.dart';

class PlayerDetail extends StatelessWidget {
  final String playerId;

  PlayerDetail(this.playerId);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? PortraitPlayerDetail(playerId)
        : LandscapePlayerDetail();
  }
}
