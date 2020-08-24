import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';

class PortraitPlayers extends StatefulWidget {
  @override
  _PortraitPlayersState createState() => _PortraitPlayersState();
}

class _PortraitPlayersState extends State<PortraitPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<PlayerBloc, PlayerState>(
            builder: (BuildContext context, PlayerState state) {
              if (state is PlayersSuccess) {
                return Column(
                  children: <Widget>[
                    _topBar(state),
                    _players(),
                  ],
                );
              }
              return BottomLoader();
            },
          ),
        ),
      ),
    );
  }

  Widget _topBar(PlayersSuccess state) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
            ),
          ),
          MyText(
            text: state.club.name,
            color: Colors.black,
            fontSize: 21,
            isTitleCase: false,
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget _players() {
    return Expanded(
      child: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (BuildContext context, PlayerState state) {
          if (state is PlayersSuccess) {
            return ListView.builder(
              itemCount: state.players.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                  },
                  child: Container(
                    height: 75,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      key: Key('${index}'),
                      children: <Widget>[
                        AddingImage(state.players[index].avatarUrl,
                            isPlayer: true),
                        SizedBox(width: 4),
                        Flexible(
                          fit: FlexFit.tight,
                          child: MyText(
                            text: state.players[index].name,
                            fontSize: 18,
                            color: Colors.black,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: state.selectedStarting.any(
                                        (Player playerStart) =>
                                            playerStart.id ==
                                            state.players[index].id) ||
                                    state.selectedSubs.any((playerSub) =>
                                        playerSub.id == state.players[index].id)
                                ? Icon(
                                    Icons.check,
                                    color: Colors.orange,
                                    size: 25,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank,
                                    size: 25,
                                    color: Colors.transparent,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return BottomLoader();
        },
      ),
    );
  }
}
