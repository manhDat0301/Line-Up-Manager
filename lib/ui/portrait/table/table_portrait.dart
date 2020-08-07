import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/utils/firestore_service.dart';

class PlayerTablePortrait extends StatefulWidget {
  @override
  _PlayerTablePortraitState createState() => _PlayerTablePortraitState();
}

class _PlayerTablePortraitState extends State<PlayerTablePortrait> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              _topBar(),
              _starting(),
              SizedBox(height: 10),
              _substitutes(),
              _bin(),
            ],
          ),
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
                  if (state is PlayerAdded) {
                    if (state.map.isEmpty) {
                      _showSnackBar();
                    } else {
                      int start = 0;
                      int subs = 0;
                      for (int i = 0; i < 18; i++) {
                        if (i <= 10 && state.map.containsKey(i)) {
                          start++;
                        }
                        if (10 < i && i < 18 && state.map.containsKey(i)) {
                          subs++;
                        }
                      }
                      if (start + subs < 8) {
                        _showSnackBar();
                      } else {
                        context
                            .bloc<PositionBloc>()
                            .add(CreateFormation(state.map.values.toList()));
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
    return Expanded(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Starting XI',
                style: TextStyle(
                  fontFamily: fontSFDisplayRegular,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TableBloc, TableState>(
                builder: (BuildContext context, TableState state) {
                  if (state is PlayerAdded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add4(0, map: state.map),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add4(4, map: state.map),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add3(8, map: state.map),
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
    return Container(
      height: 240,
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
                  if (state is PlayerAdded)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add4(11, map: state.map),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: _add3(15, map: state.map),
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

  List<Widget> _add4(int start, {Map<int, Player> map}) {
    List<Widget> list = [];
    for (int i = start; i < start + 4; i++) {
      if (map != null && map.containsKey(i)) {
        list.add(_player(map[i], i));
      } else {
        list.add(_add(i));
      }
    }
    return list;
  }

  List<Widget> _add3(int start, {Map<int, Player> map}) {
    List<Widget> list = [];
    list.add(SizedBox(width: 1));
    for (int i = start; i < start + 3; i++) {
      if (map != null && map.containsKey(i)) {
        list.add(_player(map[i], i));
      } else {
        list.add(_add(i));
      }
    }
    list.add(SizedBox(width: 1));
    return list;
  }

  Widget _bin() {
    return Align(
      alignment: Alignment.center,
      child: DragTarget(
        onAccept: (data) {
          print('onAccept $data');
          context.bloc<TableBloc>().add(PlayerDelete(data));
        },
        onWillAccept: (data) {
          return true;
        },
        builder: (BuildContext context, List<int> candidateData,
            List<dynamic> rejectedData) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: FloatingActionButton(
              elevation: 5,
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                Icons.delete_forever,
                color: Colors.orange,
                size: 33,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _add(int key) {
    return ClipOval(
      child: Material(
        child: BlocBuilder<TableBloc, TableState>(
          builder: (BuildContext context, TableState state) {
            return InkWell(
              splashColor: Colors.orangeAccent, // inkwell color
              child: SizedBox(
                width: 65,
                height: 65,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.orange,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(adding);
                context.bloc<TableBloc>().add(AddButtonPress(key));
              },
            );
          },
        ),
      ),
    );
  }

  Widget _player(Player player, int key) {
    return Draggable(
      data: key,
      feedback: _image(player),
      child: _image(player),
    );
  }

  Widget _image(Player player) {
    return Container(
      width: 65,
      height: 65,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: player.id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000.0),
          child: FutureBuilder(
            initialData: '',
            future:
                FireStorageService.loadFromStorage(context, player.avatarUrl),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return CachedNetworkImage(
                errorWidget: (context, string, dynamic) {
                  return Icon(
                    Icons.error,
                    color: Colors.orange,
                  );
                },
                placeholder: (context, string) {
                  return CircularProgressIndicator();
                },
                imageUrl: snapshot.data,
              );
            },
          ),
        ),
      ),
    );
  }

  void _showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Need at least 5 Starting and 3 Substitutes'),
    ));
  }
}
