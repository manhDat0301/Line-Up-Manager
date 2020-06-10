import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';

class SelectMode extends StatefulWidget {
  @override
  _SelectModeState createState() => _SelectModeState();
}

class _SelectModeState extends State<SelectMode> {
  CarouselController _carouselController = CarouselController();
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      print(_key.currentContext.size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        children: <Widget>[
          Align(alignment: Alignment.topCenter, child: Text('Select Mode')),
          Expanded(
              child: Align(alignment: Alignment.center, child: _carousel())),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 250,
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
                  style:
                      TextStyle(fontSize: 20, fontFamily: fontSFDisplayRegular),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _carousel() {
    return CarouselSlider(
      items: <Widget>[_portraitMode(), _landscape()],
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        initialPage: 0,
        height: 419,
        carouselController: _carouselController,
        enableInfiniteScroll: false,
        viewportFraction: 0.70,
        enlargeCenterPage: false,
      ),
      carouselController: _carouselController,
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
              child: Text(
                'Portrait Mode',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _landscape() {
    return Container(
      width: 50,
      height: 50,
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
              child: Text(
                'Landscape Mode',
              ),
            ),
          ],
        ),
      ),
    );
  }

}
