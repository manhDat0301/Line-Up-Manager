import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/utils/firestore_service.dart';

class PreviewBraven extends StatefulWidget {
  @override
  _PreviewBravenState createState() => _PreviewBravenState();
}

class _PreviewBravenState extends State<PreviewBraven> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/blue_export.png',
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(25, 25, 22, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'CITY',
                style: TextStyle(
                  wordSpacing: 1.5,
                  fontSize: 80,
                  color: Colors.white,
                  fontFamily: fontBrunoAceRegular,
                ),
              ),
              _startingFormation(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _startingFormation() {
    return BlocBuilder<ExportBloc, ExportState>(
      builder: (BuildContext context, ExportState state) {
        if (state is ExportFromPositionSuccess) {
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'STARTING XI',
                            style: TextStyle(
                              wordSpacing: 1.5,
                              fontSize: 17,
                              color: Colors.white,
                              fontFamily: fontCagliostroRegular,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height *
                                  0.09 *
                                  0.5,
                            ),
                            child: Divider(
                              color: Colors.white,
                              height: 0,
                              indent:
                                  MediaQuery.of(context).size.width * 0.029 +
                                      MediaQuery.of(context).size.width * 0.19,
                              thickness: 2,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: _player(
                            name: state.players[0].name,
                            avtUrl: state.players[0].avatarUrl,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ...Iterable<int>.generate(4).map(
                      (i) => _player(
                        name: state.players[i + 1].name,
                        avtUrl: state.players[i + 1].avatarUrl,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ...Iterable<int>.generate(3).map(
                      (i) => _player(
                        name: state.players[i + 5].name,
                        avtUrl: state.players[i + 5].avatarUrl,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width * 0.19,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ...Iterable<int>.generate(3).map(
                      (i) => _player(
                        name: state.players[i + 8].name,
                        avtUrl: state.players[i + 8].avatarUrl,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: MediaQuery.of(context).size.width * 0.19,
                    ),
                  ],
                ),
                _substitutes(),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _substitutes() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.19,
            ),
            Expanded(
              child: Divider(
                color: Colors.white,
                indent: MediaQuery.of(context).size.width * 0.029,
                height: 0,
                thickness: 2,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.19,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        _subText('ROMERO'),
                        _subText('LINDELOF'),
                        _subText('WILLIAMS'),
                        _subText('FRED'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        _subText('JAMES'),
                        _subText('MATA'),
                        _subText('IGHALO'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _subText(String subName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        subName.contains(' ')
            ? subName.substring(subName.indexOf(' '), subName.length)
            : subName,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
      ),
    );
  }

  Widget _player({String name, String avtUrl}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.19,
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.height * 0.079,
            height: MediaQuery.of(context).size.height * 0.079,
            child: FutureBuilder(
              initialData: '',
              future: FireStorageService.loadFromStorage(context, avtUrl),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10000.0),
                  child: CachedNetworkImage(
                    errorWidget: (context, string, dynamic) {
                      return Icon(
                        Icons.error,
                        color: Colors.grey,
                      );
                    },
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: imageProvider,
                          ),
                        ),
                      );
                    },
                    placeholder: (context, string) {
                      return BottomLoader();
                    },
                    imageUrl: snapshot.data ?? ' ',
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 2),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                name.contains(' ')
                    ? name.substring(name.indexOf(' '), name.length)
                    : name,
                style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.white,
                    fontFamily: fontCagliostroRegular),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
