import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/portrait/adding/favorite_players.dart';
import 'package:marozi/ui/portrait/adding/league_by_nation.dart';
import 'package:marozi/ui/portrait/adding/search_player.dart';

class AddingPortrait extends StatefulWidget {
  @override
  _AddingPortraitState createState() => _AddingPortraitState();
}

class _AddingPortraitState extends State<AddingPortrait> {

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
              SearchPlayer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                child: MyText(
                    textAlign: TextAlign.start,
                    text: 'Favorite players',
                    color: Colors.black,
                    fontSize: 16),
              ),
              FavoritePlayers(),
              LeagueByNation(),
            ],
          ),
        ),
      ),
    );
  }
}
