import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/detail/favorite_bloc/favorite_bloc.dart';
import 'package:marozi/portrait/detail/ui/custom_widget/text_cm.dart';
import 'package:marozi/portrait/detail/ui/custom_widget/text_fix.dart';
import 'package:marozi/portrait/detail/ui/custom_widget/text_info.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/utils/firestore_service.dart';

class PlayerInfo extends StatefulWidget {
  final Player player;
  final String clubUrl;

  PlayerInfo(this.player, this.clubUrl);

  @override
  _PlayerInfoState createState() => _PlayerInfoState();
}

class _PlayerInfoState extends State<PlayerInfo> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 15, 5),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _minorInfo1(),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                  child: Row(
                    children: <Widget>[
                      _minorInfo2(),
                      _minorInfo3(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _minorInfo1() {
    return Expanded(
      child: Row(
        children: <Widget>[
          FutureBuilder(
            initialData: '',
            future: FireStorageService.loadFromStorage(
                context, widget.player.avatarUrl),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10000.0),
                child: CachedNetworkImage(
                  errorWidget: (context, string, dynamic) {
                    return Container(
                      width: 120,
                      height: 120,
                      child: Icon(Icons.error, color: Colors.orange),
                    );
                  },
                  placeholder: (context, string) {
                    return BottomLoader();
                  },
                  width: 120,
                  height: 120,
                  imageUrl: snapshot.data,
                ),
              );
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: BlocProvider<FavoriteBloc>(
                        create: (BuildContext context) =>
                            FavoriteBloc(FavoriteInitial())
                              ..add(InitFavorite(widget.player.id)),
                        child: BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (BuildContext context, FavoriteState state) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .bloc<FavoriteBloc>()
                                    .add(UpdateFavorite(widget.player.id));
                              },
                              child: (state is FavoriteMarked)
                                  ? Icon(
                                      Icons.favorite,
                                      color: state.isFav
                                          ? Colors.red
                                          : Colors.grey,
                                    )
                                  : BottomLoader(),
                            );
                          },
                        ),
                      )),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFix('Height '),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextInfo(widget.player.height),
                            TextCentimeter(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        TextFix('Weight '),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextInfo(widget.player.weight ?? 'no info'),
                            TextCentimeter(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        TextFix('Birth Date '),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextInfo(widget.player.birthday),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _minorInfo2() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(child: TextFix('Club')),
                  Expanded(
                    child: FutureBuilder(
                      initialData: '',
                      future: FireStorageService.loadFromStorage(
                          context, widget.clubUrl),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return CachedNetworkImage(
                          errorWidget: (context, string, dynamic) {
                            return Container(
                              width: 50,
                              child: Icon(Icons.error),
                            );
                          },
                          placeholder: (context, string) {
                            return BottomLoader();
                          },
                          imageUrl: snapshot.data,
                          width: 50,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: TextFix('Number')),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: TextInfo(widget.player.number),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: TextFix('Value')),
                  Expanded(
                    child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: TextInfo(widget.player.wage.length > 0
                            ? widget.player.wage
                                .substring(0, widget.player.wage.indexOf(' '))
                            : 'no info')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _minorInfo3() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: TextFix('Nation')),
                  Expanded(
                    child: Container(
                      width: 50,
                      child: Image.asset(iconEngland1),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFix(
                      'Number',
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      child: TextInfo('-'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(child: TextFix('Wage')),
                  Expanded(
                    child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: TextInfo('85K')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
