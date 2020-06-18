import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/data/data.dart';
import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/players/drag_player.dart';
import 'package:provider/provider.dart';

class Landscape433 extends StatefulWidget {
  @override
  _Landscape433State createState() => _Landscape433State();
}

class _Landscape433State extends State<Landscape433> {
  GlobalKey _key = GlobalKey();

  initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Card(
        child: Stack(
          children: stackItems(context),
        ),
      ),
    );
  }

  List<Widget> stackItems(BuildContext context) {
    var playerDraggable;
    List<Widget> items = [];
    final provider = Provider.of<Data>(context);
    for (int i = 0; i < provider.listPlayers.length; i++) {
      playerDraggable = DragPlayer(i: i);
      items.add(playerDraggable);
    }
    return items;
  }

}
