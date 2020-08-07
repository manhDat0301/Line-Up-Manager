import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/portrait/adding/expansion_league.dart';

class LeagueByNation extends StatefulWidget {
  @override
  _LeagueByNationState createState() => _LeagueByNationState();
}

class _LeagueByNationState extends State<LeagueByNation> {
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
                    ExpansionLeague(
                      leagues: state.leagueByNation[nat],
                      nation: '$nat',
                      listIndex: i,
                    ),
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
}
