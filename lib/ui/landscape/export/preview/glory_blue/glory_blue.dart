import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/utils/firestore_service.dart';

class PreviewGloryBlue extends StatefulWidget {
  @override
  _PreviewGloryBlueState createState() => _PreviewGloryBlueState();
}

class _PreviewGloryBlueState extends State<PreviewGloryBlue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.629,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/landscape_blue.png'),
        ),
      ),
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (BuildContext context, ExportState state) {
          if (state is ExportFromPositionSuccess) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.52,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.centerLeft,
                      children: [
                        Image.asset(
                          'assets/images/landscape_blue_field.png',
                        ),
                        ...Iterable<int>.generate(state.players.length).map(
                          (index) => _player(
                            name: state.players[index].name,
                            number: state.players[index].number,
                            avatarUrl: state.players[index].avatarUrl,
                            offset: state.offsets[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _clubLogo(state.clubLogoUrl),
                _rightCol(state.subsName),
              ],
            );
          }
          return BottomLoader();
        },
      ),
    );
  }

  Widget _rightCol(List<String> subsName) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: double.infinity,
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: _subsText(
                name: 'MANCHESTER UNITED',
                fontSize: 17,
              ),
            ),
            Container(
              child: _subsText(
                name: 'Ole Gunnar Solskjaer',
                fontSize: 13,
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            _subsText(
              name: 'Substitutes',
              fontSize: 12,
              color: colorSubstitutesLandscapeText,
            ),
            ...Iterable<int>.generate(subsName.length).map(
              (i) => _subsText(
                name: subsName[i],
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _clubLogo(String logoUrl) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.07,
      height: MediaQuery.of(context).size.width * 0.07,
      margin: EdgeInsets.only(left: 10, top: 10),
      child: FutureBuilder(
        initialData: ' ',
        future: FireStorageService.loadFromStorage(context, logoUrl),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return CachedNetworkImage(
            placeholder: (context, string) => BottomLoader(),
            errorWidget: (context, string, dynamic) => Icon(
              Icons.error,
              color: Colors.grey,
            ),
            imageUrl: snapshot.data,
          );
        },
      ),
    );
  }

  Widget _player({
    @required String name,
    @required String number,
    @required String avatarUrl,
    @required Offset offset,
  }) {
    print(offset);
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.05,
            height: MediaQuery.of(context).size.width * 0.05,
            child: FutureBuilder(
              initialData: ' ',
              future: FireStorageService.loadFromStorage(context, avatarUrl),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return CachedNetworkImage(
                  errorWidget: (context, string, dynamic) => Icon(
                    Icons.error,
                    color: Colors.grey,
                  ),
                  placeholder: (context, string) => BottomLoader(),
                  imageUrl: snapshot.data,
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.1,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.07,
                    height: 14,
                    child: CustomPaint(
                      painter: PlayerNameTag(color: Colors.white),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right:
                                MediaQuery.of(context).size.width * 0.085 * 0.2,
                          ),
                          child: _playersText(number),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: 14,
                  child: CustomPaint(
                    painter: PlayerNameTag(color: Colors.yellow),
                    child: Center(
                      child: _playersText(name),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _playersText(String text) {
    return Text(
      text.contains(' ')
          ? text.substring(text.lastIndexOf(' '), text.length)
          : text,
      style: TextStyle(
        color: colorExportBlueText,
        fontSize: 11,
        fontFamily: fontTekoRegular,
      ),
    );
  }

  Widget _subsText({
    @required String name,
    Color color,
    @required double fontSize,
  }) {
    return Text(
      name,
      textAlign: TextAlign.end,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontFamily: fontTekoRegular,
      ),
    );
  }
}

class PlayerNameTag extends CustomPainter {
  final Color color;

  PlayerNameTag({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var points = List<Offset>();
    points.add(Offset(size.width * 0.2, 0));
    points.add(Offset(size.width, 0));
    points.add(Offset(size.width * 0.8, size.height));
    points.add(Offset(0, size.height));
    points.add(Offset(size.width * 0.2, 0));

    Path path = Path()..addPolygon(points, true);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

//    for (int i = 0; i < points.length - 1; i++) {
//      canvas.drawLine(points[i], points[i + 1], paint);
//    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
