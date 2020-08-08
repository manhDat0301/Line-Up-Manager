import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/add_button.dart';
import 'package:marozi/ui/orientation/mutual_widgets/table_player_image.dart';

class LandscapeSubstitutes extends StatefulWidget {
  @override
  _LandscapeSubstitutesState createState() => _LandscapeSubstitutesState();
}

class _LandscapeSubstitutesState extends State<LandscapeSubstitutes> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            MyText(text: 'Substitutes', color: Colors.black, fontSize: 18),
            Expanded(
              child: BlocBuilder<TableBloc, TableState>(
                builder: (BuildContext context, TableState state) {
                  if (state is PlayerAdded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add3(11, map: state.map),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add3(14, map: state.map),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[AddButton(17)],
                        ),
                      ],
                    );
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(11),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(14),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add1(17),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _add3(int start, {Map<int, Player> map}) {
    List<Widget> list = [];
    for (int i = start; i < start + 3; i++) {
      if (map != null && map.containsKey(i)) {
        list.add(_player(map[i], i));
      } else {
        list.add(AddButton(i));
      }
    }
    return list;
  }

  List<Widget> _add1(int start, {Map<int, Player> map}) {
    List<Widget> list = [];
    if (map != null && map.containsKey(start)) {
      list.add(_player(map[start], start));
    } else {
      list.add(AddButton(start));
    }
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