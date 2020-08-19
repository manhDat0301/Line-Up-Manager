import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/ui/portrait/adding/portrait_league_by_nation.dart';
import 'package:marozi/ui/portrait/adding/portrait_players_favorite.dart';
import 'package:marozi/ui/portrait/adding/portrait_search_player.dart';

class PortraitAdding extends StatefulWidget {
  @override
  _PortraitAddingState createState() => _PortraitAddingState();
}

class _PortraitAddingState extends State<PortraitAdding> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 8),
            children: <Widget>[
              _11Selected(),
              SearchPlayerPortrait(),
              FavoritePlayers(),
              LeagueByNationPortrait(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _11Selected() {
    return Row();
  }
}
