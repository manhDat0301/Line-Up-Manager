import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/portrait/adding/bloc/adding_bloc.dart';
import 'package:marozi/portrait/adding/ui/expansion_league.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';
import 'package:marozi/resources/custom_lib/my_text.dart';

class Nations extends StatefulWidget {
  @override
  _NationsState createState() => _NationsState();
}

class _NationsState extends State<Nations> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingBloc, AddingState>(
      builder: (BuildContext context, AddingState state) {
        if (state is LeagueByNationSuccess) {
          Map<String, List<League>> map = state.leagueByNation;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.hasReachedMax ? map.length : map.length + 1,
            itemBuilder: (context, i) {
              if (i < state.leagueByNation.length) {
                String nat = map.keys.toList()[i];
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
                      leagues: map[nat],
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
