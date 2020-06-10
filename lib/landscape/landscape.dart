import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marozi/players/data.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

class Landscape extends StatefulWidget {

  @override
  _LandscapeState createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
//  GlobalKey _key = GlobalKey();
  CarouselController _carouselController = CarouselController();
  int currentPage = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }

  Widget _topBar() {
    return Row(
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
                .map((int pageIndex) => Column(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              currentPage = pageIndex;
                            });
                            _carouselController.animateToPage(pageIndex);
                          },
                          child: Text(
                            Provider.of<Data>(context)
                                .listTypeFormation[pageIndex],
                            style: TextStyle(
                              color: currentPage == pageIndex
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 0.12,
                        ),
                      ],
                    ))
          ],
        ),
      ),
    );
  }
}
