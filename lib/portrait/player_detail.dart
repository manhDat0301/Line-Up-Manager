import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/resources/strings.dart';
import 'package:provider/provider.dart';

class PlayerDetail extends StatefulWidget {
  final int i;

  PlayerDetail(this.i);

  @override
  _PlayerDetailState createState() => _PlayerDetailState();
}

class _PlayerDetailState extends State<PlayerDetail> {
  int i;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    i = widget.i;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _detail(),
    );
  }

  Widget _detail() {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            _topBar(),
            _playerInfo(),
            _playerSkill(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 5.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.orange,
            ),
          ),
          Text(
            Provider.of<Data>(context).listPlayers[i].name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _playerInfo() {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 20, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _minorInfo1(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 16, right: 12),
                  child: Row(
                    children: <Widget>[
                      _minorInfo2(),
                      _minorInfo3(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _minorInfo1() {
    return Expanded(
      child: Row(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  Provider.of<Data>(context).listPlayers[i].assetImage),
              backgroundColor: colorPlayerBackground,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                      )),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        mText1('Height '),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            mText2('183'),
                            TextCm(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        mText1('Weight '),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            mText2('72'),
                            TextCm(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        mText1('Birth Date '),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            mText2('Nov. 26, 1997'),
                          ],
                        ),
                      ],
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

  Widget _minorInfo2() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1('Club'),
                  Image.asset(
                    iconMu2,
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1('Number'),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    child: mText2('29'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1('Value'),
                  Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      child: mText2('27,5M')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _minorInfo3() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1('Nation'),
                  Container(
                    width: 60,
                    height: 60,
                    child: Image.asset(iconEngland1),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1(
                    'Number',
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    child: mText2('-'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1('Wage'),
                  Container(
                      width: 60,
                      height: 60,
                      alignment: Alignment.center,
                      child: mText2('85K')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _playerSkill() {
    return Expanded(
      child: Card(
        child: Row(
          children: <Widget>[
            Image.asset(Provider.of<Data>(context).listPlayers[i].assetImage),
          ],
        ),
      ),
    );
  }

  Widget mText1(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: 16,
        color: Colors.black45,
      ),
    );
  }

  Widget mText2(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: 21,
        color: Colors.black,
      ),
    );
  }

  Widget TextCm() {
    return Text(
      'cm',
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: 13,
        color: Colors.black38,
      ),
    );
  }
}
