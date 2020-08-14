import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/fonts.dart';

class LandscapeBlueAndWhite extends StatefulWidget {
  @override
  _LandscapeBlueAndWhiteState createState() => _LandscapeBlueAndWhiteState();
}

class _LandscapeBlueAndWhiteState extends State<LandscapeBlueAndWhite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.629,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/landscape_blue_n_white.png'),
        ),
      ),
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (BuildContext context, ExportState state) {
          if (state is ExportFromPositionSuccess) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.centerLeft,
                      children: [
                        ...Iterable<int>.generate(state.players.length).map(
                          (index) => _player(
                            name: state.players[index].name,
                            number: state.players[index].number,
                            offset: state.offsets[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _substitutes(state.subsName),
              ],
            );
          }
          return BottomLoader();
        },
      ),
    );
  }

  Widget _substitutes(List<String> subsName) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _subText(
                  text: 'STARTING XI',
                  fontSize: 30,
                  color: Colors.blue,
                ),
                SizedBox(height: 4),
                _subText(
                  text: 'MANCHESTER UNITED',
                  fontSize: 16,
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _subText(
                    text: 'SUBSTITUTES',
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                  ...Iterable.generate(subsName.length).map(
                    (i) => _subText(text: subsName[i], fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subText({
    @required String text,
    @required double fontSize,
    Color color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Colors.red,
        fontFamily: fontBangersRegular,
      ),
    );
  }

  Widget _player({
    @required String name,
    @required String number,
    @required Offset offset,
  }) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              fontSize: 30,
              fontFamily: fontBlackOpsOneRegular,
              color: Colors.blue,
            ),
          ),
          Text(
            name.contains(' ')
                ? name.substring(name.indexOf(' '), name.length)
                : name,
            style: TextStyle(
              fontSize: 15,
              fontFamily: fontBangersRegular,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
