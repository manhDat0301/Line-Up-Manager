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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(
          'Detail: ${Provider.of<Data>(context, listen: false).listPlayers[i].name}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorInputBackground,
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
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _minorInfo1(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20, right: 20),
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
        padding: const EdgeInsets.only(right: 20),
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
                    width: 50,
//                    height: 30,
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
                    width: 50,
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
                      width: 50,
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
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mText1('Nation'),
                  Container(
                    width: 50,
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
                    width: 50,
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
                      width: 50,
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _field(),
                  _foot(),
                ],
              ),
              Divider(indent: 16, color: Colors.black12, endIndent: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _chart(),
                    _stat(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _foot() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Image.asset('assets/images/left_foot.png'),
                SizedBox(height: 3),
                Text(
                  '3',
                  style: TextStyle(fontSize: 17, color: Colors.black45),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/images/right_foot_colored.png'),
                SizedBox(height: 3),
                Text(
                  '5',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chart() {
    return Container(
      color: Colors.black12,
      width: 165,
      height: 165,
    );
  }

  Widget _stat() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                mText1('Overall'),
                mText2('82'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                mText1('Potential'),
                mText2('89'),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: mText1('Skill Moves'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star_half, color: Colors.orange),
                Icon(Icons.star_border, color: Colors.orange),
              ],
            ),
            Align(alignment: Alignment.centerLeft, child: mText1('Best Stat')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                mText2('Slide Tackle'),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: mText2('90'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _field() {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 30,
              height: 58,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: _borderSide(),
                    top: _borderSide(),
                    bottom: _borderSide(),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 30,
              height: 58,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: _borderSide(),
                    top: _borderSide(),
                    bottom: _borderSide(),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: VerticalDivider(
              color: Colors.black12,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              width: 100,
              height: 30,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 31.16,
                    height: 15.58,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4.49),
                    ),
                    child: Text(
                      'RB',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Container(
                    width: 31.16,
                    height: 15.58,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4.49),
                    ),
                    child: Text(
                      'RWB',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 12),
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

  BorderSide _borderSide() {
    return BorderSide(color: Colors.black12);
  }

  Widget mText1(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: 15,
        color: Colors.black45,
      ),
    );
  }

  Widget mText2(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: 18,
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
