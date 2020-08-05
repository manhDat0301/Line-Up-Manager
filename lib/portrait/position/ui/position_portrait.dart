import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/position/bloc/position_bloc.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/resources/custom_lib/my_text.dart';

class PositionPortrait extends StatefulWidget {
  final List<Player> players;

  PositionPortrait(this.players);

  @override
  _PositionPortraitState createState() => _PositionPortraitState();
}

class _PositionPortraitState extends State<PositionPortrait> {
  final CarouselController _carouselController = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PositionBloc(PositionInitial()),
      child: Scaffold(
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
            fontSize: 20,
          ),
        ),
        InkWell(
          onTap: () {
//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (BuildContext context) => ExportPortrait()));
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
      child: BlocBuilder<PositionBloc, PositionState>(
        builder: (BuildContext context, PositionState state) {
          return CarouselSlider(
            carouselController: _carouselController,
            items: Constants.carouselPortrait,
            options: CarouselOptions(
              onPageChanged: (int, reason) {
//                context
//                    .bloc<PositionBloc>()
//                    .add(CarouselPageChange(currentPage: int));
              },
              height: double.infinity,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              initialPage: 0,
              enableInfiniteScroll: false,
            ),
          );
        },
      ),
    );
  }

  Widget _textFormation() {
    return Text(
      'Formation',
      style: TextStyle(
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
              child: BlocBuilder<PositionBloc, PositionState>(
                builder: (BuildContext context, PositionState state) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.players.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
//                              context
//                                  .bloc<PositionBloc>()
//                                  .add(TypeFormationChange(i));
//                              _carouselController.animateToPage(i);
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: MyText(
                                text: widget.players[index].name,
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          index < widget.players.length - 1
                              ? VerticalDivider()
                              : Container(),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
