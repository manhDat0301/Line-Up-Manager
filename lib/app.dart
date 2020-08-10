import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/resources/strings.dart';
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
          create: (BuildContext context) =>
              PositionBloc(PositionInitial())..add(PositionTestEvent()),
        ),
        BlocProvider<ExportBloc>(
          create: (BuildContext context) => ExportBloc(ExportInitial()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.orange,
          fontFamily: fontSFDisplayRegular,
        ),
        initialRoute: position,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/homepage':
              return MaterialPageRoute(
                  builder: (BuildContext context) => HomePage());
              break;
            case '/position':
              return MaterialPageRoute(
                  builder: (BuildContext context) => Position());
              break;
            case '/table':
              return MaterialPageRoute(
                  builder: (BuildContext context) => PlayerTable());
              break;
            case '/adding':
              return MaterialPageRoute(
                  builder: (BuildContext context) => Adding());
              break;
            case '/detail':
              return MaterialPageRoute(
                  builder: (BuildContext context) =>
                      PlayerDetail(settings.arguments));
              break;
            case '/export':
              return MaterialPageRoute(
                  builder: (BuildContext context) => Export());
              break;
            default:
              return MaterialPageRoute(
                  builder: (BuildContext context) => HomePage());
              break;
          }
        },
      ),
    );
  }
}
