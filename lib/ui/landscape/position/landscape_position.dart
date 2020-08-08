
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/ui/orientation/export.dart';

class LandscapePosition extends StatefulWidget {
  @override
  _LandscapePositionState createState() => _LandscapePositionState();
}

class _LandscapePositionState extends State<LandscapePosition> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: <Widget>[
                _topBar(),
                _formation(context),
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

  Widget _formation(context) {
    return Expanded(
      child: BlocBuilder<PositionBloc, PositionState>(
        builder: (BuildContext context, PositionState state) {
          return PageView(
            children: <Widget>[
//              Formation(),
            ],
          );
        },
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
//            ...Iterable<int>.generate(
//                Provider.of<Data>(context).listTypeFormation.length)
//                .map(
//                  (int pageIndex) => Wrap(
//                children: <Widget>[
//                  Container(
//                    width: 140,
//                    height: 48,
//                    padding: const EdgeInsets.only(left: 20.0),
//                    child: InkWell(
//                      onTap: () {
//                        _carouselController.animateToPage(pageIndex);
//                      },
//                      child: Align(
//                        alignment: Alignment.centerLeft,
//                        child: MyText(
//                          text: Provider.of<Data>(context)
//                              .listTypeFormation[pageIndex],
//                          color: Provider.of<Data>(context).carouselPageIndex ==
//                              pageIndex
//                              ? Colors.red
//                              : Colors.black,
//                          fontSize: 17,
//                        ),
//                      ),
//                    ),
//                  ),
//                  pageIndex <
//                      Provider.of<Data>(context).listTypeFormation.length -
//                          1
//                      ? Divider(
//                    color: Colors.black,
//                    thickness: 0.12,
//                    height: 0,
//                    indent: 20,
//                  )
//                      : Container(),
//                ],
//              ),
//            )
          ],
        ),
      ),
    );
  }
}
