import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_club_image.dart';

class PortraitExpansionClub extends StatefulWidget {
  final Club club;

  PortraitExpansionClub({Key key, this.club}) : super(key: key);

  @override
  _PortraitExpansionClubState createState() => _PortraitExpansionClubState();
}

class _PortraitExpansionClubState extends State<PortraitExpansionClub> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerBloc>(
      create: (BuildContext context) => PlayerBloc(PlayerInitial()),
      child: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (BuildContext context, PlayerState state) {
          return Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 18),
            child: ExpansionTile(
              initiallyExpanded: false,
              onExpansionChanged: (bool) {
                if (bool) {
                  context.bloc<PlayerBloc>().add(GetPlayerByClub(widget.club));
                }
              },
              leading: AddingClubImage(widget.club),
              title: MyText(
                text: widget.club.name,
                color: null,
                textAlign: TextAlign.start,
                fontSize: 18,
                isTitleCase: true,
              ),
              children: <Widget>[_player(state)],
            ),
          );
        },
      ),
    );
  }

  Widget _player(PlayerState state) {
    if (state is PlayersByClub) {
      return Padding(
        padding: const EdgeInsets.only(left: 78),
        child: SingleChildScrollView(
          child: state.players.length != 0
              ? Container(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.players.length,
                    itemBuilder: (context, index) {
                      return BlocBuilder<TableBloc, TableState>(
                        builder: (BuildContext context, TableState tableState) {
                          return InkWell(
                            onTap: () {
                              context
                                  .bloc<TableBloc>()
                                  .add(PlayerSelect(state.players[index].id));
                              Navigator.pushNamedAndRemoveUntil(context, table,
                                  ModalRoute.withName(homepage));
                            },
                            child: Column(
                              children: <Widget>[
                                index != 0 && index < state.players.length
                                    ? Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Divider(height: 1),
                                    )
                                    : Container(),
                                Container(
                                  height: 52,
                                  alignment: Alignment.centerLeft,
                                  child: MyText(
                                    color: Colors.black,
                                    text: state.players[index].name,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              : Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text('No players'),
                ),
        ),
      );
    }
    return BottomLoader();
  }
}
