import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String data_1 = '1';
String data_2 = '2';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyBloc>(
      create: (BuildContext context) => MyBloc(MyStateInitial()),
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(
              builder: (BuildContext context) {
                return Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('GetData_1'),
                      onPressed: () {
                        context.bloc<MyBloc>().add(MyEvent.GetData_1);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    SecondPage()));
                      },
                    ),
                    RaisedButton(
                      child: Text('GetData_2'),
                      onPressed: () {
                        context.bloc<MyBloc>().add(MyEvent.GetData_2);
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    SecondPage()));
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<MyBloc, MyState>(
          builder: (BuildContext context, MyState state) {
            if (state is DataLoaded) {
              return Row(
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    state.data,
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

enum MyEvent { GetData_1, GetData_2 }

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc(MyState initialState) : super(initialState);

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    switch (event) {
      case MyEvent.GetData_1:
        await Future.delayed(Duration(milliseconds: 800));
        yield DataLoaded(data_1);
        break;
      case MyEvent.GetData_2:
        await Future.delayed(Duration(milliseconds: 800));
        yield DataLoaded(data_2);
        break;
    }
  }
}

class MyState {}

class MyStateInitial extends MyState {}

class DataLoaded extends MyState {
  final String data;

  DataLoaded(this.data);
}
