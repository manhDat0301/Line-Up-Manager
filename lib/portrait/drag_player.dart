import 'package:flutter/material.dart';
import 'package:marozi/players/data.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

import '../resources/colors.dart';

class DragPlayer extends StatelessWidget {
  final int i;

  @override
  Widget build(BuildContext context) {
    return _MyDragPlayer(i: i);
  }

  DragPlayer({Key key, this.i}) : super(key: key);
}

class _MyDragPlayer extends StatefulWidget {
  final int i;

  @override
  _MyDragPlayerState createState() => _MyDragPlayerState();

  _MyDragPlayer({Key key, this.i}) : super(key: key);
}

class _MyDragPlayerState extends State<_MyDragPlayer> {
  int i;
  double top;
  double left;

//  GlobalKey _key = GlobalKey();
  Offset offset = Offset(100, 100);

  @override
  void initState() {
    super.initState();
    i = widget.i;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      print(_key.currentContext.size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    left = Provider.of<Data>(context).listPlayers[i].offset.dx;
    top = Provider.of<Data>(context).listPlayers[i].offset.dy;
    return _draggable();
  }

  Widget _draggable() {
    return AnimatedPositioned(
      left: left,
      top: top,
      duration: Duration(
          milliseconds:
              Provider.of<Data>(context).listPlayers[i].assetImage != null
                  ? 400
                  : 0),
      child: Draggable(
        child: _dragChild(context),
        childWhenDragging: Opacity(
          opacity: 0.5,
          child: _dragChild(context),
        ),
        feedback: _dragChild(context),
        data: 1 as dynamic,
        onDragEnd: (details) {
          if (details.wasAccepted) {
            Provider.of<Data>(context, listen: false).swapPlayersPortrait(i);
          }
        },
      ),
    );
  }

  Widget _dragChild(BuildContext context) {
    final player = Provider.of<Data>(context).listPlayers[i];
    return DragTarget(
      builder: (BuildContext context, List<dynamic> candidateData,
          List<dynamic> rejectedData) {
        return player.assetImage != null
            ? _player(player, candidateData)
            : _empty(player, candidateData);
      },
      onWillAccept: (data) {
        return data == 1;
      },
      onAccept: (data) {
        Provider.of<Data>(context, listen: false).playerTarget(i);
      },
    );
  }

  Widget _player(player, candidateData) {
    return Opacity(
      opacity: candidateData.isEmpty ? 1 : 0.7,
      child: Column(
        children: <Widget>[
          player.assetImage == null
              ? Container(
                  width: 65,
                  height: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: candidateData.isEmpty
                            ? Colors.transparent
                            : Colors.orange),
                  ),
                  child: candidateData.isEmpty
                      ? null
                      : Icon(Icons.add_circle, color: Colors.orange),
                )
              : Container(
                  width: 65,
                  height: 65,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(player.assetImage),
                    backgroundColor: candidateData.isEmpty
                        ? colorPlayerBackground
                        : Colors.white,
                  ),
                ),
          Text(
            player.assetImage == null ? '' : player.name,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: fontSFDisplayRegular,
              fontSize: 11.5,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _empty(player, candidateData) {
    return Column(
      children: <Widget>[
        player.assetImage == null
            ? Container(
                width: 65,
                height: 74,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: candidateData.isEmpty
                          ? Colors.transparent
                          : Colors.orange),
                ),
                child: candidateData.isEmpty
                    ? null
                    : Icon(
                        Icons.swap_horiz,
                        color: Colors.orange,
                        size: 60,
                      ),
              )
            : Container(
                width: 65,
                height: 65,
                child: CircleAvatar(
                  backgroundImage: AssetImage(player.assetImage),
                  backgroundColor: candidateData.isEmpty
                      ? colorPlayerBackground
                      : Colors.white,
                ),
              ),
        Text(
          player.assetImage == null ? '' : player.name,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: fontSFDisplayRegular,
            fontSize: 11.5,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
