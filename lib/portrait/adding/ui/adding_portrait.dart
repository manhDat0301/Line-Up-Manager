import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/adding/bloc/adding_bloc.dart';
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
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      context.bloc<AddingBloc>().add(GetLeagueByNation());
    }
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
            controller: _controller,
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
              Nations(),
            ],
          ),
        ),
      ),
    );
  }
}
