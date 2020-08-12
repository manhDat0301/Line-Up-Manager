import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/ui/portrait/export/portrait_export_players.dart';
import 'package:marozi/utils/firestore_service.dart';

class PortraitExportPage extends StatefulWidget {
  @override
  _PortraitExportPageState createState() => _PortraitExportPageState();
}

class _PortraitExportPageState extends State<PortraitExportPage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (BuildContext context, ExportState state) {
          if (state is ExportFromPositionSuccess) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('assets/images/glory_red.png'),
                ),
              ),
              child: Column(
                children: [
                  _clubCoach(state),
                  PortraitExportPlayers(),
                  _substitutes(),
                ],
              ),
            );
          }
          return BottomLoader();
        },
      ),
    );
  }

  Widget _clubCoach(ExportFromPositionSuccess state) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
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
                        color: Colors.white,
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
              MyText(
                color: Colors.white,
                fontSize: 20.09,
                fontFamily: fontBebasNeueRegular,
                text: 'coach name'.toUpperCase(),
                isTitleCase: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _substitutes() {
    return Expanded(
      child: BlocBuilder<TableBloc, TableState>(
        builder: (BuildContext context, TableState state) {
          if (state is PlayerAdded) {
            List<String> subsName = [];
//            for (int i = 11; i < 18; i++) {
//              if (state.map.containsKey(i)) {
//                subsName.add(state.map[i].name);
//              }
//            }
            subsName = [
              'asdasdsadasds',
              'asddsdsdds',
              'asdsdadds',
              'asddsdasds',
              'asdddss',
              'asdsds',
              'asdddds',
            ];
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SUBSTITUTES',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ...Iterable<int>.generate(subsName.length ?? 0).map(
                        (i) => _subsName(subsName[i]),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return BottomLoader();
        },
      ),
    );
  }

  Widget _subsName(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.white,),
    );
  }
}
