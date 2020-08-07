import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/position/position_bloc/position_bloc.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/utils/firestore_service.dart';

class DragPlayer extends StatefulWidget {
  final int index;

  DragPlayer(this.index);

  @override
  _DragPlayerState createState() => _DragPlayerState();
}

class _DragPlayerState extends State<DragPlayer> {
  Offset offset;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _draggable();
  }

  Widget _draggable() {
    return BlocBuilder<PositionBloc, PositionState>(
      builder: (BuildContext context, state) {
        if (state is PositionSuccess) {
          offset = state.offsets[widget.index];
          return AnimatedPositioned(
            left: offset.dx,
            top: offset.dy,
            duration: Duration(milliseconds: 200),
            child: InkWell(
              onDoubleTap: () {
                Navigator.pushNamed(context, detail,
                    arguments: state.players[widget.index].id);
              },
              child: Draggable(
                childWhenDragging: _dragChild(context),
                child: _dragChild(context),
                feedback: _dragChild(context),
                data: widget.index,
                onDraggableCanceled: (velocity, offset) {
                  context
                      .bloc<PositionBloc>()
                      .add(DropPlayer(offset, widget.index));
                },
                onDragEnd: (details) {},
              ),
            ),
          );
        } else {
          return BottomLoader();
        }
      },
    );
  }

  Widget _dragChild(BuildContext context) {
    return DragTarget(
      builder: (BuildContext context, List<int> candidateData,
          List<dynamic> rejectedData) {
        return _player();
      },
      onWillAccept: (data) {
        return data != null ? true : false;
      },
      onAccept: (data) {
        context.bloc<PositionBloc>().add(PositionSwap(data, widget.index));
      },
    );
  }

  Widget _player() {
    return BlocBuilder<PositionBloc, PositionState>(
      builder: (BuildContext context, PositionState state) {
        if (state is PositionSuccess) {
          Player player = state.players[widget.index];
          return Column(
            children: <Widget>[
              FutureBuilder(
                initialData: '',
                future: FireStorageService.loadFromStorage(
                    context, player.avatarUrl),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10000.0),
                    child: Container(
                      width: 75,
                      height: 75,
                      child: CachedNetworkImage(
                        errorWidget: (context, string, dynamic) {
                          return Icon(
                            Icons.error,
                            color: Colors.orange,
                          );
                        },
                        placeholder: (context, string) {
                          return BottomLoader();
                        },
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
        } else {
          return BottomLoader();
        }
      },
    );
  }
}
