import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/orientation/adding.dart';
import 'package:marozi/orientation/detail.dart';
import 'package:marozi/orientation/home_page.dart';
import 'package:marozi/orientation/position.dart';
import 'package:marozi/orientation/table.dart';
import 'package:marozi/portrait/adding/bloc/adding_bloc.dart';
import 'package:marozi/portrait/table/bloc/table_bloc.dart';
import 'package:marozi/resources/fonts.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.orange,
          accentColor: Colors.orange,
          fontFamily: fontSFDisplayRegular,
        ),
        initialRoute: '/homepage',
        onGenerateRoute: (settings) {
          print('onGenerateRoute ${settings.name}');
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  builder: (BuildContext context) => HomePage());
              break;
            case '/position':
              return MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Position(settings.arguments));
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
                  builder: (BuildContext context) => PlayerDetail(settings.arguments));
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
