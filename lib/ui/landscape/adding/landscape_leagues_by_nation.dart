import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/landscape/adding/landscape_leagues_column.dart';
import 'package:marozi/ui/orientation/mutual_widgets/landscape_adding_divider.dart';

class LandscapeLeaguesByNation extends StatefulWidget {
  @override
  _LandscapeLeaguesByNationState createState() =>
      _LandscapeLeaguesByNationState();
}

class _LandscapeLeaguesByNationState extends State<LandscapeLeaguesByNation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingBloc, AddingState>(
      builder: (BuildContext context, AddingState state) {
        if (state is AddingSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.leagueByNation.length,
            itemBuilder: (context, i) {
              String nat = state.leagueByNation.keys.toList()[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 5, bottom: 5),
                    child: MyText(
                      text: '$nat',
                      color: Colors.black,
                      fontSize: 15,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  _buildLeague(state.leagueByNation[nat]),
                ],
              );
            },
          );
        }
        return BottomLoader();
      },
    );
  }

  Widget _buildLeague(List<League> list) {
    return Container(
      padding: EdgeInsets.fromLTRB(13, 8, 8, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              index < list.length && index != 0
                  ? LandscapeAddingDivider()
                  : Container(),
              LandscapeLeaguesColumn(list[index]),
            ],
          );
        },
      ),
    );
  }
}
