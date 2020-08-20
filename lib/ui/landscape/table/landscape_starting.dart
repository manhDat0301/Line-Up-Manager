import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/add_button.dart';
import 'package:marozi/ui/orientation/mutual_widgets/table_player_image.dart';

class LandscapeStarting extends StatefulWidget {
  @override
  _LandscapeStartingState createState() => _LandscapeStartingState();
}

class _LandscapeStartingState extends State<LandscapeStarting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.51,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          MyText(text: 'Starting XI', color: Colors.black, fontSize: 18),
          Expanded(
            child: BlocBuilder<TableBloc, TableState>(
              builder: (BuildContext context, TableState state) {
                if (state is TableAddedSuccess) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(0, players: state.players),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(3, players: state.players),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(6, players: state.players),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add2(9, players: state.players),
                      ),
                    ],
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _add3(0),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _add3(3),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _add3(6),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _add2(9),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _add3(int start, {List<Player> players}) {
    List<Widget> list = [];
    for (int i = start; i < start + 3; i++) {
      if (players != null && players.contains(i)) {
        list.add(_player(players[i], i));
      } else {
        list.add(AddButton(i));
      }
    }
    return list;
  }

  List<Widget> _add2(int start, {List<Player> players}) {
    List<Widget> list = [];
    list.add(SizedBox(height: 10));
    for (int i = start; i < start + 2; i++) {
      if (players != null && players.contains(i)) {
        list.add(_player(players[i], i));
      } else {
        list.add(AddButton(i));
      }
    }
    list.add(SizedBox(height: 10));
    return list;
  }

  Widget _player(Player player, int key) {
    return Draggable(
      data: key,
      feedback: TablePlayerImage(player),
      child: TablePlayerImage(player),
    );
  }
}
