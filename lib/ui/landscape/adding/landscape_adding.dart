import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/ui/landscape/adding/landscape_clubs_column.dart';
import 'package:marozi/ui/landscape/adding/landscape_leagues_by_nation.dart';
import 'package:marozi/ui/landscape/adding/landscape_players_column.dart';
import 'package:marozi/ui/landscape/adding/landscape_players_search.dart';

class LandscapeAdding extends StatefulWidget {
  @override
  _LandscapeAddingState createState() => _LandscapeAddingState();
}

class _LandscapeAddingState extends State<LandscapeAdding> {
  bool isPremierLSelect = true;
  bool isChampionshipSelect = false;
  bool isLeagueOneSelect = false;
  bool isManUSelect = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClubBloc>(
          create: (BuildContext context) => ClubBloc(ClubInitial()),
        ),
        BlocProvider<PlayerBloc>(
          create: (BuildContext context) => PlayerBloc(PlayerInitial()),
        ),
      ],
      child: Scaffold(
        backgroundColor: colorInputBackground,
        body: SafeArea(
          top: true,
          left: true,
          right: true,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildLeaguesColumn(),
                  LandscapeClubsColumn(),
                  LandscapePlayersColumn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaguesColumn() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.289,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LandscapePlayersSearch(),
            LandscapeLeaguesByNation(),
          ],
        ),
      ),
    );
  }
}
