import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/utils/firestore_service.dart';

class PreviewFieldXI extends StatefulWidget {
  @override
  _PreviewFieldXIState createState() => _PreviewFieldXIState();
}

class _PreviewFieldXIState extends State<PreviewFieldXI> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.629,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/field_xi.png'),
        ),
      ),
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (BuildContext context, ExportState state) {
          if (state is ExportFromPositionSuccess) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.19,
                        alignment: Alignment.center,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'UNITED',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 45,
                              fontFamily: fontConsolasBold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.52,
                          height: MediaQuery.of(context).size.height * 0.71,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              ...Iterable<int>.generate(state.players.length)
                                  .map(
                                (index) => _player(
                                  name: state.players[index].name,
                                  number: state.players[index].number,
                                  offset: state.offsets[index],
                                  avatarUrl: state.players[index].avatarUrl,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
//                _substitutes(state.subsName),
              ],
            );
          }
          return BottomLoader();
        },
      ),
    );
  }

  Widget _player({
    @required Offset offset,
    @required String name,
    @required String number,
    @required String avatarUrl,
  }) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.085,
            height: MediaQuery.of(context).size.height * 0.11,
            color: Colors.white.withOpacity(0.35),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.085,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FutureBuilder(
                  initialData: ' ',
                  future:
                      FireStorageService.loadFromStorage(context, avatarUrl),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return CachedNetworkImage(
                      width: MediaQuery.of(context).size.width * 0.05,
                      height: MediaQuery.of(context).size.height * 0.09,
                      errorWidget: (context, string, dynamic) => Icon(
                        Icons.error,
                        color: Colors.grey,
                      ),
                      alignment: Alignment.center,
                      placeholder: (context, string) => BottomLoader(),
                      imageUrl: snapshot.data,
                    );
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(2),
                      child: Text(
                        number,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7.5,
                          fontFamily: fontConsolasBold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(1, 2, 0, 2),
                        child: Text(
                          name.contains(' ')
                              ? name.substring(
                                  name.lastIndexOf(' '), name.length)
                              : name,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontFamily: fontConsolasBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
