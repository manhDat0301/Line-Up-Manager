import 'package:flutter/material.dart';
import 'package:marozi/ui/landscape/position/landscape_formation.dart';
import 'package:marozi/ui/landscape/position/landscape_type_formation.dart';
import 'package:marozi/ui/orientation/export.dart';

class LandscapePosition extends StatefulWidget {
  @override
  _LandscapePositionState createState() => _LandscapePositionState();
}

class _LandscapePositionState extends State<LandscapePosition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: true,
        right: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              _topBar(),
              Expanded(
                child: Row(
                  children: <Widget>[
                    LandscapeFormation(),
                    LandscapeTypeFormation(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        Text(
          'Position',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Export(),
                ),
              );
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
