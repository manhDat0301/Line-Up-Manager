import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marozi/players/data.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

class Portrait extends StatefulWidget {
  @override
  _PortraitState createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  final CarouselController _carouselController = CarouselController();
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//      Provider.of<Data>(context, listen: false).setIsPortrait(true);
//      print(_key.currentContext.size.width);
//      print(_key.currentContext.size.height);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: _key,
      top: true,
      left: true,
      right: true,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              children: <Widget>[
                _topBar(),
                _carousel(context),
                _textFormation(),
                _bottomFormation(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
          Text(
            'Position',
            style: TextStyle(
              fontFamily: fontSFDisplayRegular,
              fontSize: 20,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange,
          ),
        ],
      ),
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
                  Row(
                    children: <Widget>[
                      ...Iterable<int>.generate(Provider.of<Data>(context)
                              .listFormationPort
                              .length)
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
                                        Provider.of<Data>(context,
                                                listen: false)
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
