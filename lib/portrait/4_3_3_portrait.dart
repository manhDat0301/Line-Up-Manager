import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/data/data.dart';
import 'package:provider/provider.dart';

import '../players/drag_player.dart';

class Portrait433 extends StatefulWidget {
  @override
  _Portrait433State createState() => _Portrait433State();
}

class _Portrait433State extends State<Portrait433> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      width: double.infinity,
      child: Card(
        child: Stack(
          children: stackItems(context),
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
    return items;
  }
}
