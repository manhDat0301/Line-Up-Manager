import 'package:flutter/material.dart';
import 'package:marozi/ui/portrait/detail/detail_portrait.dart';

class PlayerDetail extends StatelessWidget {
  final String playerId;

  PlayerDetail(this.playerId);

  @override
  Widget build(BuildContext context) {
    return PlayerDetailPortrait(playerId);
  }
}
