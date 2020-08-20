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
                    if (state.players.isEmpty) {
                      _showSnackBar();
                    } else {
                      int enough = state.players.length + state.subs.length;
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
              child: BlocBuilder<TableBloc, TableState>(
                builder: (BuildContext context, TableState state) {
                  if (state is TableAddedSuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add4(0, players: state.players),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add4(4, players: state.players),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add3(8, players: state.players),
                        ),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add4(0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add4(4),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(8),
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
              child: BlocBuilder<TableBloc, TableState>(
                builder: (BuildContext context, TableState state) {
                  if (state is TableAddedSuccess)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add4(11, players: state.players),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add3(15, players: state.players),
                        ),
                      ],
                    );
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add4(11),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _add3(15),
                      ),
                    ],
                  );
                  ;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _add4(int start, {List<Player> players}) {
    List<Widget> list = [];
    for (int i = start; i < start + 4; i++) {
      if (players != null && players.contains(i)) {
        list.add(_player(players[i], i));
      } else {
        list.add(AddButton(i));
      }
    }
    return list;
  }

  List<Widget> _add3(int start, {List<Player> players}) {
    List<Widget> list = [];
    list.add(SizedBox(width: 1));
    for (int i = start; i < start + 3; i++) {
      if (players != null && players.contains(i)) {
        list.add(_player(players[i], i));
      } else {
        list.add(AddButton(i));
      }
    }
    list.add(SizedBox(width: 1));
    return list;
  }

  Widget _player(Player player, int key) {
    return Draggable(
      data: key,
      feedback: TablePlayerImage(player),
      child: TablePlayerImage(player),
    );
  }

  void _showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Need at least 5 Starting and 3 Substitutes'),
    ));
  }
}
