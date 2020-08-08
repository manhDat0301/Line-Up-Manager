import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/portrait/adding/portrait_expansion_league.dart';

class LeagueByNationPortrait extends StatefulWidget {
  @override
  _LeagueByNationPortraitState createState() => _LeagueByNationPortraitState();
}

class _LeagueByNationPortraitState extends State<LeagueByNationPortrait> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingBloc, AddingState>(
      builder: (BuildContext context, AddingState state) {
        if (state is LeagueByNationSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.leagueByNation.length,
            itemBuilder: (context, i) {
              if (i < state.leagueByNation.length) {
                String nat = state.leagueByNation.keys.toList()[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
                      child: MyText(
                        text: '$nat',
                        color: Colors.black,
                        fontSize: 16,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    _buildLeague(state.leagueByNation[nat]),
                  ],
                );
              } else {
                return Container(height: 50, child: BottomLoader());
              }
            },
          );
        } else {
          return BottomLoader();
        }
      },
    );
  }

  Widget _buildLeague(List<League> list){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ExpansionLeaguePortrait(index: index, league: list[index]);
          },
        ),
      ),
    );
  }
}
