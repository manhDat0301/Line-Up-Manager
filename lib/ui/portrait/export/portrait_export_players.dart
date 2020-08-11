import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/utils/firestore_service.dart';

class PortraitExportPlayers extends StatefulWidget {
  @override
  _PortraitExportPlayersState createState() => _PortraitExportPlayersState();
}

class _PortraitExportPlayersState extends State<PortraitExportPlayers> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExportBloc, ExportState>(
        builder: (BuildContext context, ExportState state) {
          if (state is ExportFromPositionSuccess) {
            return Container(
              alignment: Alignment.center,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    'assets/images/mask_group.png',
                    height: MediaQuery.of(context).size.height * 0.49,
                  ),
                  ...Iterable<int>.generate(state.players.length).map(
                    (index) => _player(
                      offset: state.offsets[index],
                      player: state.players[index],
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _player({@required Offset offset, @required Player player}) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Column(
        children: <Widget>[
          Container(
            width: 45,
            height: 45,
            child: Stack(
              children: [
                FutureBuilder(
                  initialData: '',
                  future: FireStorageService.loadFromStorage(
                      context, player.avatarUrl),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10000.0),
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data ?? '',
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
                        errorWidget: (context, string, dynamic) {
                          return Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.error,
                              color: Colors.orange,
                            ),
                          );
                        },
                        placeholder: (context, string) {
                          return BottomLoader();
                        },
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000.0),
                      color: Colors.yellow,
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        '83',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: colorPlayerNumberExport,
                          fontFamily: fontBebasNeueBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: MyText(
              text: player.name.contains(' ')
                  ? player.name.substring(
                      player.name.lastIndexOf(' '),
                      player.name.length,
                    )
                  : player.name,
              color: Colors.white,
              fontSize: 12,
              fontFamily: fontBebasNeueBold,
            ),
          ),
        ],
      ),
    );
  }
}
