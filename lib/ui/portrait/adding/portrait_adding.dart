import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/ui/portrait/adding/portrait_leagues.dart';
import 'package:marozi/ui/portrait/adding/portrait_players_favorite.dart';
import 'package:marozi/ui/portrait/adding/portrait_search_player.dart';
import 'package:marozi/utils/firestore_service.dart';

class PortraitAdding extends StatefulWidget {
  @override
  _PortraitAddingState createState() => _PortraitAddingState();
}

class _PortraitAddingState extends State<PortraitAdding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: <Widget>[
                _selectedImages(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SearchPlayerPortrait(),
                        FavoritePlayers(),
                        PortraitLeagues(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedImages() {
    return Container(
      height: 80,
      child: ListView.builder(
        itemCount: 11,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (BuildContext context, int index) {
          return BlocBuilder<AddingBloc, AddingState>(
            builder: (BuildContext context, AddingState state) {
              if (state is AddingSuccess) {
                return _imageBuild(players: state.starting, index: index);
              }
              return BottomLoader();
            },
          );
        },
      ),
    );
  }

  Widget _imageBuild({List<Player> players, int index}) {
    return FutureBuilder(
      initialData: '',
      future: FireStorageService.loadFromStorage(
        context,
        players != null && index < players.length
            ? players[index].avatarUrl
            : 'gs://coach-tool-development.appspot.com/images/SUPERLIGA/Club/Arsenal-Fútbol-Club/Player/Alejo-Antilef.jpg',
      ),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          width: 70,
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10000.0),
            child: CachedNetworkImage(
              errorWidget: (context, str, dyna) => Icon(
                Icons.error,
                color: Colors.orange,
              ),
              placeholder: (context, string) => BottomLoader(),
              imageUrl: snapshot.data ?? '',
            ),
          ),
        );
      },
    );
  }
}
