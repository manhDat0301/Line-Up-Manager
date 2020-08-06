import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/utils/firestore_service.dart';

class DragPlayer extends StatefulWidget {
  final Player player;
  final Offset offset;

  DragPlayer(this.player, this.offset);

  @override
  _DragPlayerState createState() => _DragPlayerState();
}

class _DragPlayerState extends State<DragPlayer> {
  @override
  Widget build(BuildContext context) {
    return _draggable();
  }

  Widget _draggable() {
    return Positioned(
      left: widget.offset.dx,
      top: widget.offset.dy,
      child: InkWell(
        onDoubleTap: () {
//          Navigator.of(context).push(MaterialPageRoute(
//              builder: (BuildContext context) => PlayerDetail(i)));
        },
        child: Draggable(
          child: _dragChild(context),
          childWhenDragging: Opacity(
            opacity: 0.5,
            child: _dragChild(context),
          ),
          feedback: _dragChild(context),
//          data: i,
          onDragEnd: (details) {},
        ),
      ),
    );
  }

  Widget _dragChild(BuildContext context) {
    return DragTarget(
      builder: (BuildContext context, List<dynamic> candidateData,
          List<dynamic> rejectedData) {
        return _player(widget.player);
      },
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
//        context.bloc<PositionBloc>().add(PositionSwap(i, data));
      },
    );
  }

  Widget _player(Player player) {
    return Column(
      children: <Widget>[
        FutureBuilder(
          initialData: '',
          future: FireStorageService.loadFromStorage(context, player.avatarUrl),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10000.0),
              child: Container(
                width: 75,
                height: 75,
                child: CachedNetworkImage(
                  imageUrl: snapshot.data,
                ),
              ),
            );
          },
        ),
        Text(
          player.name.indexOf(' ') > 0
              ? player.name
                  .substring(player.name.indexOf(' '), player.name.length)
              : player.name,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
