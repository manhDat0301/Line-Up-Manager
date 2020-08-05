import 'package:flutter/material.dart';
import 'package:marozi/portrait/adding/ui/favorite_players.dart';
import 'package:marozi/portrait/adding/ui/league_by_nation.dart';
import 'package:marozi/portrait/adding/ui/search_player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_lib/my_text.dart';

class AddingPortrait extends StatefulWidget {
  @override
  _AddingPortraitState createState() => _AddingPortraitState();
}

class _AddingPortraitState extends State<AddingPortrait> {
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            children: <Widget>[
              SearchPlayer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                child: MyText(
                    textAlign: TextAlign.start,
                    text: 'Favorite players',
                    color: Colors.black,
                    fontSize: 16),
              ),
              FavoritePlayers(),
              Nations(),
            ],
          ),
        ),
      ),
    );
  }
}
