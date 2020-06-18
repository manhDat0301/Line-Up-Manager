import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marozi/common/home_page.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                HomePage())));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.center,
              child: Image.asset('assets/images/braven.png')),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'BRAVEN SPORT',
                    style: TextStyle(
                      fontFamily: fontBebasNeueBold,
                      fontSize: 30,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        backgroundColor: colorPlayerBackground,
                        valueColor: AlwaysStoppedAnimation(Colors.orange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
