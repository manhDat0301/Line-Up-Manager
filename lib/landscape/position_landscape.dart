import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marozi/common/export.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/data/data.dart';

class PositionLandscape extends StatefulWidget {
  @override
  _PositionLandscapeState createState() => _PositionLandscapeState();
}

class _PositionLandscapeState extends State<PositionLandscape> {
  CarouselController _carouselController = CarouselController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Data>(context, listen: false).orientation(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorInputBackground,
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: <Widget>[
                _topBar(),
                _carousel(context),
              ],
            );
          },
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
            fontFamily: fontSFDisplayRegular,
            fontSize: 20,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Export(),
              ));
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

  Widget _carousel(context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: CarouselSlider(
              carouselController: _carouselController,
              items: Provider.of<Data>(context).listFormationLands,
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                initialPage: 0,
                enableInfiniteScroll: false,
                onScrolled: (i) {},
                onPageChanged: (int, reason) {
                  print('$int $reason');
                  Provider.of<Data>(context, listen: false)
                      .setCarouselPageIndex(int);
                },
              ),
            ),
          ),
          _formationSelect(context),
        ],
      ),
    );
  }

  Widget _formationSelect(context) {
    return Card(
      child: Container(
        width: 115,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ...Iterable<int>.generate(
                    Provider.of<Data>(context).listTypeFormation.length)
                .map(
              (int pageIndex) => Wrap(
                children: <Widget>[
                  Container(
                    width: 140,
                    height: 48,
                    padding: const EdgeInsets.only(left: 20.0),
                    child: InkWell(
                      onTap: () {
                        _carouselController.animateToPage(pageIndex);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: Provider.of<Data>(context)
                              .listTypeFormation[pageIndex],
                          color: Provider.of<Data>(context).carouselPageIndex ==
                                  pageIndex
                              ? Colors.red
                              : Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  pageIndex <
                          Provider.of<Data>(context).listTypeFormation.length -
                              1
                      ? Divider(
                          color: Colors.black,
                          thickness: 0.12,
                          height: 0,
                          indent: 20,
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
