import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/position/position_bloc/position_bloc.dart';
import 'package:marozi/portrait/position/ui/formation.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';

class PositionPortrait extends StatefulWidget {
  @override
  _PositionPortraitState createState() => _PositionPortraitState();
}

class _PositionPortraitState extends State<PositionPortrait> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    print(
        'width: ${MediaQuery.of(context).size.width} height: ${MediaQuery.of(context).size.height}');
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
          return PageView(
            children: <Widget>[
              Formation(),
            ],
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
          child: BlocBuilder<PositionBloc, PositionState>(
            builder: (BuildContext context, PositionState state) {
              return Card(
                  child: state is PositionSuccess
                      ? Container(
                          height: 58,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.formations.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      context
                                          .bloc<PositionBloc>()
                                          .add(FormationChange(index));
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: Text(
                                          state.formations[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: state.currentPage == index
                                                ? Colors.orange
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  index < state.offsets.length - 1
                                      ? VerticalDivider()
                                      : Container(),
                                ],
                              );
                            },
                          ),
                        )
                      : BottomLoader());
            },
          ),
        ),
      ],
    );
  }
}
