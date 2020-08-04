import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/adding/bloc/adding_bloc.dart';
import 'package:marozi/portrait/adding/ui/expansion_league.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class Nations extends StatefulWidget {
  @override
  _NationsState createState() => _NationsState();
}

class _NationsState extends State<Nations> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingBloc, AddingState>(
      builder: (BuildContext context, AddingState state) {
        if (state is LeagueByNationInitial)
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
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: MyText(
                      text: '$nat',
                      color: Colors.black,
                      fontSize: 16,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ExpansionLeague(
                    leagues: state.leagueByNation[nat],
                    nation: '$nat',
                    listIndex: i,
                  ),
                ],
              );
            },
          );
        else
          return BottomLoader();
      },
    );
  }
}
