import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/ui/orientation/mutual_widgets/add_button.dart';
import 'package:marozi/ui/orientation/mutual_widgets/garbage_can.dart';
import 'package:marozi/ui/orientation/mutual_widgets/table_player_image.dart';

class PortraitPlayerTable extends StatefulWidget {
  @override
  _PortraitPlayerTableState createState() => _PortraitPlayerTableState();
}

class _PortraitPlayerTableState extends State<PortraitPlayerTable> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _topBar(),
            _starting(),
            _substitutes(),
            GarbageCan(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 20),
          Text(
            'Adding players',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          BlocBuilder<TableBloc, TableState>(
            builder: (BuildContext context, TableState state) {
              return InkWell(
                onTap: () {
                  if (state is TableAddedSuccess) {
                    if (state.starting.isEmpty) {
                      _showSnackBar();
                    } else {
//                      int enough = state.starting.length + state.subs.length;
                      int enough = 0;
                      if (enough < 8) {
                        _showSnackBar();
                      } else {
//                        context
//                            .bloc<PositionBloc>()
//                            .add(CreateFormation(list, true));
                        Navigator.pushNamed(context, position);
                      }
                    }
                  } else {
                    _showSnackBar();
                  }
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _starting() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.51,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Starting XI',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add(start: 0, isStartingSelect: true, count: 4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add(start: 4, isStartingSelect: true, count: 4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add(start: 8, isStartingSelect: true, count: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _substitutes() {
    return Expanded(
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Substitutes',
                style: TextStyle(
                  fontFamily: fontSFDisplayRegular,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add(start: 0, isStartingSelect: false, count: 4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add(start: 4, isStartingSelect: false, count: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _add({int start, bool isStartingSelect, @required count}) {
    List<Widget> list = [];
    if (count == 3) {
      list.add(SizedBox(width: 1));
    }

    for (int i = start; i < start + count; i++) {
      list.add(BlocBuilder<TableBloc, TableState>(
        builder: (BuildContext context, TableState state) {
          if (state is TableAddedSuccess) {
            if (isStartingSelect) {
              if (state.starting != null && i < state.starting.length) {
                return _player(
                  index: i,
                  players: state.starting,
                  isStarting: isStartingSelect,
                );
              } else {
                return AddButton(
                  state.starting ?? [],
                  isStartingSelect,
                );
              }
            } else {
              if (state.subs != null && i < state.subs.length) {
                return _player(
                  index: i,
                  players: state.subs,
                  isStarting: isStartingSelect,
                );
              } else {
                return AddButton(
                  state.subs ?? [],
                  isStartingSelect,
                );
              }
            }
          }
          return AddButton([], isStartingSelect);
        },
      ));
    }
    if (count == 3) {
      list.add(SizedBox(width: 1));
    }
    return list;
  }

  Widget _player({int index, List<Player> players, bool isStarting}) {
    return Draggable(
      data: [index, isStarting],
      feedback: TablePlayerImage(players[index]),
      child: TablePlayerImage(players[index]),
    );
  }

  void _showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Need at least 5 Starting and 3 Substitutes')));
  }
}
