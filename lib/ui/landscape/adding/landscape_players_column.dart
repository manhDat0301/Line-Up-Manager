import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/landscape_adding_divider.dart';

class LandscapePlayersColumn extends StatefulWidget {
  @override
  _LandscapePlayersColumnState createState() => _LandscapePlayersColumnState();
}

class _LandscapePlayersColumnState extends State<LandscapePlayersColumn> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
        padding: EdgeInsets.only(left: 18, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: BlocBuilder<PlayerBloc, PlayerState>(
          builder: (BuildContext context, PlayerState state) {
            if (state is PlayersByClub) {
              return ListView.builder(
                itemCount: state.players.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      index != 0 && index < state.players.length
                          ? LandscapeAddingDivider()
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 6.5),
                        child: MyText(
                          text: state.players[index].name,
                          color: Colors.black,
                          fontSize: 16,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
