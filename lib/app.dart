import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/orientation/adding.dart';
import 'package:marozi/orientation/home_page.dart';
import 'package:marozi/orientation/table.dart';
import 'package:marozi/portrait/adding/bloc/adding_bloc.dart';
import 'package:marozi/portrait/table/bloc/table_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TableBloc>(
          create: (BuildContext context) => TableBloc(TableInitial()),
        ),
        BlocProvider<AddingBloc>(
          create: (BuildContext context) => AddingBloc(AddingInitial()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(),
        initialRoute: '/homepage',
        routes: <String, WidgetBuilder>{
          '/homepage': (BuildContext context) => HomePage(),
          '/table': (BuildContext context) => PlayerTable(),
          '/adding': (BuildContext context) => Adding(),
        },
      ),
    );
  }
}
