import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/portrait/player_table.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/data/data.dart';

class ModePortrait extends StatefulWidget {
  @override
  _ModePortraitState createState() => _ModePortraitState();
}

class _ModePortraitState extends State<ModePortrait> {
  CarouselController _carouselController = CarouselController();
  PageController _pageController = PageController(
    viewportFraction: 0.9,
    initialPage: 0,
  );
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: MyText(
                    text: 'Select mode',
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Spacer(),
            _pageView(),
            _goButton(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _pageView() {
    return Container(
      height: 523,
      child: PageView(
        onPageChanged: (bool) {
//          SystemChrome.setPreferredOrientations([
//            DeviceOrientation.landscapeRight,
//            DeviceOrientation.landscapeLeft,
//          ]);
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _portraitMode(),
          _landscape(),
        ],
      ),
    );
  }

  Widget _portraitMode() {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Image.asset('assets/images/portrait.png'),
          Expanded(
            child: Center(
              child: MyText(
                text: 'Portrait Mode',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _landscape() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.asset('assets/images/landscape.png'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Center(
                    child: MyText(
                      text: 'Landscape Mode',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _goButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: () {
          Provider.of<Data>(context, listen: false).orientation(true);
//          Navigator.of(context).push(PageRouteBuilder(
//              pageBuilder:
//                  (BuildContext context, animation, secondaryAnimation) =>
//                      PlayerTable()));
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => PlayerTable()));
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.88,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                HexColor('FF7008'),
                HexColor('FF964A'),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Go',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontFamily: fontSFDisplayRegular),
          ),
        ),
      ),
    );
  }
}
