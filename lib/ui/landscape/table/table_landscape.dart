import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/landscape/adding/adding_landscape.dart';
import 'package:marozi/ui/orientation/position.dart';

class PlayerTableLandscape extends StatefulWidget {
  @override
  _PlayerTableLandscapeState createState() => _PlayerTableLandscapeState();
}

class _PlayerTableLandscapeState extends State<PlayerTableLandscape> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: [
            _topBar(),
            _center(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(),
        MyText(
          text: 'Adding Players',
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Position(),
            ));
          },
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _center() {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _deleteBtn(),
          _startingXI(),
          _substitutes(),
        ],
      ),
    );
  }

  Widget _deleteBtn() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      child: Icon(
        Icons.delete_forever,
        size: 33,
        color: Colors.orange,
      ),
    );
  }

  Widget _startingXI() {
    return Container(
      width: 378,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          MyText(
            text: 'Starting XI',
            color: Colors.black,
            fontSize: 19,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _addPlayer(),
                    _addPlayer(),
                    _addPlayer(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _addPlayer(),
                    _addPlayer(),
                    _addPlayer(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _addPlayer(),
                    _addPlayer(),
                    _addPlayer(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 10),
                    _addPlayer(),
                    _addPlayer(),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _substitutes() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.fromLTRB(15, 6, 15, 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            MyText(text: 'Substitutes', color: Colors.black, fontSize: 18),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _addPlayer(),
                      _addPlayer(),
                      _addPlayer(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _addPlayer(),
                      _addPlayer(),
                      _addPlayer(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(height: 65),
                      _addPlayer(),
                      SizedBox(height: 65),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addPlayer() {
    return ClipOval(
      child: InkWell(
        splashColor: Colors.orange,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => AddingLandscape()));
        },
        child: Container(
          width: 65,
          height: 65,
          color: colorInputBackground,
          child: Icon(
            Icons.add_circle,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
