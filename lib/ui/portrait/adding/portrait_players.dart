import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';

class PortraitPlayers extends StatefulWidget {
  @override
  _PortraitPlayersState createState() => _PortraitPlayersState();
}

class _PortraitPlayersState extends State<PortraitPlayers> {
  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<PlayerBloc, PlayerState>(
            builder: (BuildContext context, PlayerState state) {
              if (state is PlayersSuccess) {
                return CustomScrollView(
                  slivers: <Widget>[
                    _topBar(state),
                    _players(),
                  ],
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
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
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  context.bloc<TableBloc>().add(
                        PlayerSelect(
                          state.isStartingSelect
                              ? state.selectedStarting
                              : state.selectedSubs,
                          state.isStartingSelect,
                        ),
                      );
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
        ],
      ),
    );
  }

  Widget _players() {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (BuildContext context, PlayerState state) {
        if (state is PlayersSuccess) {
          return SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    context
                        .bloc<PlayerBloc>()
                        .add(MultiSelectPlayer(state.players[index]));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
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
                            context
                                .bloc<PlayerBloc>()
                                .add(MultiSelectPlayer(state.players[index]));
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
              childCount: state.players.length,
            ),
            itemExtent: 70.0,
          );
        }
        return BottomLoader();
      },
    );
  }
}
