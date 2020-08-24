import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/utils/firestore_service.dart';

class TablePlayerImage extends StatefulWidget {
  final Player player;
  final int index;
  final bool isStarting;

  TablePlayerImage(this.player, {this.index, this.isStarting});

  @override
  _TablePlayerImageState createState() => _TablePlayerImageState();
}

class _TablePlayerImageState extends State<TablePlayerImage> {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: [widget.index, widget.isStarting],
      feedback: _image(),
      child: _image(),
    );
  }

  Widget _image() {
    return Container(
      width: 65,
      height: 65,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail', arguments: widget.player.id);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10000.0),
          child: FutureBuilder(
            initialData: '',
            future: FireStorageService.loadFromStorage(
                context, widget.player.avatarUrl),
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
                imageUrl: snapshot.data ?? '',
              );
            },
          ),
        ),
      ),
    );
  }
}
