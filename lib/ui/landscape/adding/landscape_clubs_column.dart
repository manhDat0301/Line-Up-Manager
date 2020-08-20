import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';
import 'package:marozi/ui/orientation/mutual_widgets/landscape_adding_divider.dart';

class LandscapeClubsColumn extends StatefulWidget {
  @override
  _LandscapeClubsColumnState createState() => _LandscapeClubsColumnState();
}

class _LandscapeClubsColumnState extends State<LandscapeClubsColumn> {
  @override
  Widget build(BuildContext context) {
    return _teamColumn();
  }

  Widget _teamColumn() {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: EdgeInsets.only(left: 18, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: BlocBuilder<ClubBloc, ClubState>(
          builder: (BuildContext context, ClubState state) {
            if (state is ClubByLeagueSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.clubs.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context
                          .bloc<PlayerBloc>()
                          .add(GetPlayerByClub(state.clubs[index]));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        index != 0 && index < state.clubs.length
                            ? LandscapeAddingDivider()
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 6.5),
                          child: BlocBuilder<PlayerBloc, PlayerState>(
                            builder: (BuildContext context,
                                PlayerState playerState) {
                              return Row(
                                children: <Widget>[
                                  AddingImage(state.clubs[index].logoUrl),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 6),
                                      child: MyText(
                                        text: state.clubs[index].name,
                                        color: playerState is PlayersByClub &&
                                                playerState.club ==
                                                    state.clubs[index]
                                            ? Colors.deepOrangeAccent
                                            : Colors.black,
                                        fontSize: 16,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
