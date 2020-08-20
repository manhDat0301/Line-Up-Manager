import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/bloc/adding/favorite_bloc/favorite_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/bloc/detail/detail_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/ui/example/example.dart';
import 'package:marozi/ui/orientation/adding.dart';
import 'package:marozi/ui/orientation/detail.dart';
import 'package:marozi/ui/orientation/export.dart';
import 'package:marozi/ui/orientation/home_page.dart';
import 'package:marozi/ui/orientation/position.dart';
import 'package:marozi/ui/orientation/table.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TableBloc>(
          create: (BuildContext context) => TableBloc(TableInitial()),
        ),
        BlocProvider<AddingBloc>(
          create: (BuildContext context) =>
              AddingBloc(AddingInitial())..add(GetLeagueByNation()),
        ),
        BlocProvider<PositionBloc>(
          create: (BuildContext context) => PositionBloc(PositionInitial())
            ..add(PositionTestEvent(isPortrait: true)),
        ),
        BlocProvider<ExportBloc>(
          create: (BuildContext context) => ExportBloc(ExportInitial()),
        ),
        BlocProvider<DetailBloc>(
          create: (BuildContext context) => DetailBloc(DetailInitial()),
        ),
        BlocProvider<FavoriteBloc>(
          create: (BuildContext context) =>
              FavoriteBloc(FavoriteInitial())..add(FavoriteFetch()),
        ),
        BlocProvider<PlayerBloc>(
          create: (BuildContext context) => PlayerBloc(PlayerInitial()),
        ),
        BlocProvider<ClubBloc>(
          create: (BuildContext context) => ClubBloc(ClubInitial()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.orange,
          fontFamily: fontSFDisplayRegular,
        ),
        initialRoute: table,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/homepage':
              return CupertinoPageRoute(
                  builder: (BuildContext context) => HomePage());
              break;
            case '/position':
              return CupertinoPageRoute(
                  builder: (BuildContext context) => Position());
              break;
            case '/table':
              return CupertinoPageRoute(
                  builder: (BuildContext context) => PlayerTable());
              break;
            case '/adding':
              return CupertinoPageRoute(
                  builder: (BuildContext context) => Adding());
              break;
            case '/detail':
              return CupertinoPageRoute(
                  builder: (BuildContext context) =>
                      PlayerDetail(settings.arguments));
              break;
            case '/export':
              return CupertinoPageRoute(
                  builder: (BuildContext context) => Export());
              break;
            case '/example':
              return CupertinoPageRoute(
                  builder: (BuildContext context) => FirstPage());
              break;
            default:
              return CupertinoPageRoute(
                  builder: (BuildContext context) => HomePage());
              break;
          }
        },
      ),
    );
  }
}
