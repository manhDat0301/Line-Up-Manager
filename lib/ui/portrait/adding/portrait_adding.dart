import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
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
  void initState() {
    super.initState();
  }

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
                Container(
                  height: 720,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
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

  List<String> url = [
    'gs://coach-tool-development.appspot.com/images/SUPERLIGA/Club/Arsenal-Fútbol-Club/Player/Alejo-Antilef.jpg',
    'gs://coach-tool-development.appspot.com/images/A-LEAGUE/Club/Adelaide-United/Player/Dakota-Ochsenham.jpg',
    'gs://coach-tool-development.appspot.com/images/SUPERLIGA/Club/Arsenal-Fútbol-Club/Player/Emiliano-Méndez.jpg',
    'gs://coach-tool-development.appspot.com/images/FORTUNA-LIGA/Club/FC-Bohemians-Prag-1905/Player/Jakub-Necas.jpg',
    'gs://coach-tool-development.appspot.com/images/SUPERLIGA/Club/Club-Atlético-Patronato/Player/Leandro-Marín.jpg',
  ];

  Widget _selectedImages() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: 11,
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (BuildContext context, int index) {
          return BlocBuilder<TableBloc, TableState>(
            builder: (BuildContext context, TableState state) {
              return FutureBuilder(
                future: FireStorageService.loadFromStorage(
                    context, index < 5 ? url[index] : url[0]),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
            },
          );
        },
      ),
    );
  }
}
