import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/portrait/adding/player_bloc/player_bloc.dart';
import 'package:marozi/portrait/table/bloc/table_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/utils/firestore_service.dart';

class ExpansionClub extends StatefulWidget {
  final Club club;

  ExpansionClub({Key key, this.club}) : super(key: key);

  @override
  _ExpansionClubState createState() => _ExpansionClubState();
}

class _ExpansionClubState extends State<ExpansionClub> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerBloc>(
      create: (BuildContext context) => PlayerBloc(PlayerInitial()),
      child: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (BuildContext context, PlayerState state) {
          return ExpansionTile(
            onExpansionChanged: (bool) {
              if (bool) {
                context.bloc<PlayerBloc>().add(GetPlayerByClub(widget.club));
              }
            },
            leading: FutureBuilder(
              initialData: '',
              future: FireStorageService.loadFromStorage(
                  context, widget.club.logoUrl),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return CachedNetworkImage(
                  errorWidget: (context, string, dynamic) => Icon(Icons.error),
                  imageUrl: snapshot.data,
                );
              },
            ),
            title: MyText(
              text: widget.club.name,
              color: null,
              textAlign: TextAlign.start,
              fontSize: 18,
              isTitleCase: true,
            ),
            children: <Widget>[_player(state)],
          );
        },
      ),
    );
  }

  Widget _player(PlayerState state) {
    if (state is PlayersByClub) {
      return Padding(
        padding: const EdgeInsets.only(left: 78),
        child: SingleChildScrollView(
          child: state.players.length != 0
              ? Container(
                  height: state.players.length < 2 ? 30 : 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.players.length,
                    itemBuilder: (context, index) {
                      return BlocBuilder<TableBloc, TableState>(
                        builder: (BuildContext context, TableState tableState) {
                          return InkWell(
                            onTap: () {
                              context
                                  .bloc<TableBloc>()
                                  .add(PlayerSelect(state.players[index]));
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/table', ModalRoute.withName('/homepage'));
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              child: MyText(
                                color: Colors.black,
                                text: '${state.players[index].name}',
                                fontSize: 17,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              : Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text('No players'),
                ),
        ),
      );
    }
    return BottomLoader();
  }
}
