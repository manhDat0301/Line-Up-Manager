
import 'package:flutter/material.dart';
import 'package:marozi/repository/constants.dart';

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
    for (int i = 0; i < Constants.listPlayers.length; i++) {
//      items.add(DragPlayer(i: i));
    }
    return items;
  }
}