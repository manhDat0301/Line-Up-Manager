import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/ui/portrait/export/preview/glory_red/glory_red_players_position.dart';
import 'package:marozi/utils/firestore_service.dart';

class PreviewGloryRed extends StatefulWidget {
  @override
  _PreviewGloryRedState createState() => _PreviewGloryRedState();
}

class _PreviewGloryRedState extends State<PreviewGloryRed> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExportBloc, ExportState>(
      builder: (BuildContext context, ExportState state) {
        if (state is ExportFromPositionSuccess) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/portrait_red.png',
                fit: BoxFit.fitWidth,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _clubCoach(state),
                  GloryRedPlayersPosition(),
                  _substitutes(),
                ],
              ),
            ],
          );
        }
        return BottomLoader();
      },
    );
  }

  Widget _clubCoach(ExportFromPositionSuccess state) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            initialData: '',
            future:
                FireStorageService.loadFromStorage(context, state.clubLogoUrl),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.12,
                height: MediaQuery.of(context).size.width * 0.12,
                child: ClipRRect(
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
                    imageUrl: snapshot.data ?? '',
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyText(
                color: Colors.white,
                fontSize: 28.81,
                fontFamily: fontBebasNeueBold,
                text: state.clubName.toUpperCase(),
                isTitleCase: false,
              ),
              SizedBox(height: 2),
              Text(
                'coach name'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.09,
                  fontFamily: fontBebasNeueRegular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _substitutes() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      child: BlocBuilder<TableBloc, TableState>(
        builder: (BuildContext context, TableState state) {
//          if (state is PlayerAdded) {
          List<String> subsName = [];
//            for (int i = 11; i < 18; i++) {
//              if (state.map.containsKey(i)) {
//                subsName.add(state.map[i].name);
//              }
//            }
          subsName = [
            'ROMERO',
            'LINDELOF',
            'WILLIAMS',
            'FRED',
            'JAMES',
            'MATA',
            'IGHALO',
          ];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: MyText(
                  color: colorSubstitutesText,
                  fontSize: 11,
                  fontFamily: fontBebasNeueRegular,
                  text: 'SUBSTITUTES'.toUpperCase(),
                  isTitleCase: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ...Iterable<int>.generate(subsName.length).map(
                          (i) => _subsName(subsName[i]),
                        ),
                      ],
                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        ...Iterable<int>.generate(
//                                subsName.length <= 4 ? subsName.length : 4)
//                            .map(
//                          (i) => _subsName(subsName[i]),
//                        ),
//                      ],
//                    ),
//                    Row(
//                      mainAxisSize: MainAxisSize.min,
//                      children: <Widget>[
//                        ...Iterable<int>.generate(
//                                subsName.length > 4 ? subsName.length - 4 : 0)
//                            .map(
//                          (i) => _subsName(subsName[i + 4]),
//                        ),
//                      ],
//                    ),
                  ],
                ),
              ),
            ],
          );
//          }
//          return BottomLoader();
        },
      ),
    );
  }

  Widget _subsName(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: MyText(
        color: Colors.white,
        fontSize: 14,
        fontFamily: fontBebasNeueRegular,
        text: text.toUpperCase(),
        isTitleCase: false,
      ),
    );
  }
}
