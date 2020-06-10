import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marozi/players/data.dart';
import 'package:provider/provider.dart';

import 'drag_player.dart';

class Portrait433 extends StatefulWidget {
  @override
  _Portrait433State createState() => _Portrait433State();
}

class _Portrait433State extends State<Portrait433> {
  GlobalKey _key = GlobalKey();

  initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      print(_key.currentContext.size.width);
//      print(_key.currentContext.size.height);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        width: double.infinity,
        child: Card(
          child: Stack(
            children: stackItems(context),
          ),
        ),
      ),
    );
  }

  List<Widget> stackItems(BuildContext context) {
    List<Widget> items = [];
    final provider = Provider.of<Data>(context);
    for (int i = 0; i < provider.listPlayers.length; i++) {
      items.add(DragPlayer(i: i));
    }
//    for (int i = 0; i < provider.listEmptyTarget.length; i++) {
//      items.add(EmptyDragTarget(
//        i: i
//      ));
//    }
    return items;
  }
}
