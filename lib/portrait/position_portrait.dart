import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/data/data.dart';

import 'export_portrait.dart';

class PositionPortrait extends StatefulWidget {
  @override
  _PositionPortraitState createState() => _PositionPortraitState();
}

class _PositionPortraitState extends State<PositionPortrait> {
  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Data>(context, listen: false).orientation(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Container(
          padding: EdgeInsets.only(bottom: 0),
          child: Column(
            children: <Widget>[
              _topBar(),
              _carousel(context),
              _textFormation(),
              _bottomFormation(context),
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
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        Text(
          'Position',
          style: TextStyle(
            fontFamily: fontSFDisplayRegular,
            fontSize: 20,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => ExportPortrait()));
          },
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _carousel(context) {
    return Expanded(
      child: CarouselSlider(
        carouselController: _carouselController,
        items: Provider.of<Data>(context).listFormationPort,
        options: CarouselOptions(
          onScrolled: (double d) {
            Provider.of<Data>(context, listen: false)
                .setCarouselPageIndex(d.toInt());
          },
          height: double.infinity,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          initialPage: 0,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }

  Widget _textFormation() {
    return Text(
      'Formation',
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: 20,
      ),
    );
  }

  Widget _bottomFormation(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Card(
            child: Container(
              height: 58,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ...Iterable<int>.generate(
                          Provider.of<Data>(context).listFormationPort.length)
                      .map((int pageIndex) => Row(
                            children: <Widget>[
                              FlatButton(
                                  child: Text(
                                    Provider.of<Data>(context)
                                        .listTypeFormation[pageIndex],
                                    style: TextStyle(
                                      color: Provider.of<Data>(context)
                                                  .carouselPageIndex ==
                                              pageIndex
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<Data>(context, listen: false)
                                        .setCarouselPageIndex(pageIndex);
                                    _carouselController
                                        .animateToPage(pageIndex);
                                  }),
                              VerticalDivider(
                                thickness: 0.12,
                                endIndent: 15,
                                indent: 15,
                                width: 0,
                                color: Colors.black,
                              ),
                            ],
                          )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Portrait2 extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return _carousel(context);
  }

  Widget _carousel(context) {
    return Expanded(
      child: CarouselSlider(
        carouselController: _carouselController,
        items: Provider.of<Data>(context).listFormationPort,
        options: CarouselOptions(
          onScrolled: (double d) {
            Provider.of<Data>(context, listen: false)
                .setCarouselPageIndex(d.toInt());
          },
          height: double.infinity,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          initialPage: 0,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
