import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/adding/bloc/adding_bloc.dart';
import 'package:marozi/portrait/adding/ui/favorite_players.dart';
import 'package:marozi/portrait/adding/ui/nation.dart';
import 'package:marozi/portrait/adding/ui/search_player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

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
            padding: EdgeInsets.only(left: 6, right: 6),
            children: <Widget>[
              SearchPlayer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: MyText(
                    textAlign: TextAlign.start,
                    text: 'Favourite players',
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
