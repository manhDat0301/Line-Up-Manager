import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/table/bloc/table_bloc.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/fonts.dart';

class PlayerTablePortrait extends StatefulWidget {
  @override
  _PlayerTablePortraitState createState() => _PlayerTablePortraitState();
}

class _PlayerTablePortraitState extends State<PlayerTablePortrait> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: <Widget>[
              _topBar(),
              _starting(),
              SizedBox(height: 10),
              _substitutes(),
              _deleteBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 20),
          Text(
            'Adding players',
            style: TextStyle(
              fontFamily: fontSFDisplayRegular,
              fontSize: 20,
            ),
          ),
          InkWell(
            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (BuildContext context) => Position()));
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  Widget _starting() {
    return Expanded(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Starting XI',
                style: TextStyle(
                  fontFamily: fontSFDisplayRegular,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add4(0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add4(4),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add3(8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _substitutes() {
    return Container(
      height: 240,
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Substitutes',
                style: TextStyle(
                  fontFamily: fontSFDisplayRegular,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add4(11),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _add3(15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _add4(int start) {
    List<Widget> list = [];
    for (int i = start; i < start + 4; i++) {
      list.add(_add(i));
    }
    return list;
  }

  List<Widget> _add3(int start) {
    List<Widget> list = [];
    list.add(SizedBox(width: 1));
    for (int i = start; i < start + 3; i++) {
      list.add(_add(i));
    }
    list.add(SizedBox(width: 1));
    return list;
  }

  Widget _deleteBtn() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: FloatingActionButton(
          elevation: 5,
          backgroundColor: Colors.white,
          onPressed: () {},
          child: Icon(
            Icons.delete_forever,
            color: Colors.orange,
            size: 33,
          ),
        ),
      ),
    );
  }

  Widget _add(int key) {
    return ClipOval(
      child: Material(
        child: BlocBuilder<TableBloc, TableState>(
          builder: (BuildContext context, TableState state) {return InkWell(
            splashColor: Colors.orangeAccent, // inkwell color
            child: SizedBox(
              width: 65,
              height: 65,
              child: Icon(
                Icons.add_circle,
                color: Colors.orange,
              ),
            ),
            onTap: () {
              context.bloc<TableBloc>().add(AddButtonPress(key));
              Navigator.of(context).pushNamed('/adding');
            },
            onDoubleTap: () {
//            Navigator.of(context).push(MaterialPageRoute(
//                builder: (BuildContext context) => PlayerDetail(0)));
            },
          );  },
        ),
      ),
    );
  }
}
