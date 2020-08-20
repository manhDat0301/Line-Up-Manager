import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/detail/detail_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/portrait/detail/custom_widget/text_cm.dart';
import 'package:marozi/ui/portrait/detail/custom_widget/text_fix.dart';
import 'package:marozi/ui/portrait/detail/custom_widget/text_info.dart';
import 'package:marozi/utils/firestore_service.dart';

class LandscapePlayerDetail extends StatefulWidget {
  @override
  _LandscapePlayerDetailState createState() => _LandscapePlayerDetailState();
}

class _LandscapePlayerDetailState extends State<LandscapePlayerDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (BuildContext context, DetailState state) {
              if (state is DetailedLoadSuccess) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          _topBar(state.player),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    _infoTop(),
                                    Divider(
                                      indent: 25,
                                      endIndent: 25,
                                    ),
                                    _infoBottom(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Card(
                        child: Column(
                          children: <Widget>[],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return BottomLoader();
            },
          ),
        ),
      ),
    );
  }

  Widget _topBar(Player player) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
        ),
        MyText(
          text: player.name,
          isTitleCase: false,
          color: Colors.black,
          fontSize: 19,
        ),
        SizedBox(width: 20),
      ],
    );
  }

  Widget _infoTop() {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (BuildContext context, DetailState state) {
        if (state is DetailedLoadSuccess) {
          return Row(
            children: <Widget>[
              FutureBuilder(
                initialData: '',
                future: FireStorageService.loadFromStorage(
                    context, state.player.avatarUrl),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10000.0),
                      child: CachedNetworkImage(
                        placeholder: (context, string) => BottomLoader(),
                        errorWidget: (context, string, dynamic) => Icon(
                          Icons.error,
                          color: Colors.orange,
                        ),
                        imageUrl: snapshot.data ?? '',
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.165,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            context
                                .bloc<DetailBloc>()
                                .add(UpdateFavorite(state.player.id));
                          },
                          child: Icon(
                            Icons.favorite,
                            color: state.isFav ? Colors.orange : Colors.grey,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          TextFix('Height '),
                          TextInfo(state.player.height),
                          TextSmallUpper('cm'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          TextFix('Weight '),
                          TextInfo(state.player.weight),
                          TextSmallUpper('km'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          TextFix('Birth date '),
                          TextInfo(state.player.birthday),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return BottomLoader();
      },
    );
  }

  Widget _infoBottom() {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (BuildContext context, DetailState state) {
        if (state is DetailedLoadSuccess) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFix('Club'),
                            FutureBuilder(
                              initialData: '',
                              future: FireStorageService.loadFromStorage(
                                  context, state.clubImageUrl),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.width * 0.06,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(10000.0),
                                    child: CachedNetworkImage(
                                      placeholder: (context, string) =>
                                          BottomLoader(),
                                      errorWidget: (context, string, dynamic) =>
                                          Icon(
                                        Icons.error,
                                        color: Colors.orange,
                                      ),
                                      imageUrl: snapshot.data ?? '',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFix('Number'),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.06,
                              alignment: Alignment.center,
                              child: TextInfo(state.player.number),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFix('Value(€)'),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.06,
                              alignment: Alignment.center,
                              child: TextInfo(state.player.wage.contains(' ')
                                  ? state.player.wage.substring(
                                      0, state.player.wage.indexOf(' '))
                                  : state.player.wage),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFix('Nation'),
                            FutureBuilder(
                              initialData: 'images/assets/england1.png',
                              future: FireStorageService.loadFromStorage(
                                  context, state.clubImageUrl),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  height:
                                      MediaQuery.of(context).size.width * 0.06,
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(10000.0),
                                    child: CachedNetworkImage(
                                      placeholder: (context, string) =>
                                          BottomLoader(),
                                      errorWidget: (context, string, dynamic) =>
                                          Icon(
                                        Icons.error,
                                        color: Colors.orange,
                                      ),
                                      imageUrl: 'images/assets/england1.png',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFix('Number'),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.06,
                              alignment: Alignment.center,
                              child: TextInfo(state.player.number),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            TextFix('Wage'),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.06,
                              alignment: Alignment.center,
                              child: TextInfo(state.player.wage.contains(' ')
                                  ? state.player.wage.substring(
                                      0, state.player.wage.indexOf(' '))
                                  : state.player.wage),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return BottomLoader();
      },
    );
  }
}
