import 'package:flutter/material.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/landscape/player_table.dart';
import 'package:marozi/portrait/adding.dart';
import 'package:marozi/portrait/player_detail.dart';
import 'package:marozi/portrait/portrait.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

class PlayerTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return ChangeNotifierProvider(
        create: (BuildContext context) => Data(),
        builder: (BuildContext context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: AddPlayerPage()),
          );
        },
      );
    } else {
      return ChangeNotifierProvider(
        create: (BuildContext context) => Data(),
        builder: (BuildContext context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: PlayerTableLandscape()),
          );
        },
      );
    }
  }
}

class AddPlayerPage extends StatefulWidget {
  @override
  _AddPlayerPageState createState() => _AddPlayerPageState();
}

class _AddPlayerPageState extends State<AddPlayerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
  }

  @override
  Widget build(BuildContext context) {
//    if (MediaQuery.of(context).orientation == Orientation.portrait) {
    return Scaffold(
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
//    } else {
    return PlayerTableLandscape();
//    }
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Portrait()));
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
                    children: <Widget>[
                      _add(),
                      _add(),
                      _add(),
                      _add(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _add(),
                      _add(),
                      _add(),
                      _add(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 1),
                      _add(),
                      _add(),
                      _add(),
                      SizedBox(width: 1),
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

  Widget _add() {
    return ClipOval(
      child: Material(
        child: InkWell(
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PlayerAdding()));
          },
          onDoubleTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PlayerDetail(0)));
          },
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
                    children: <Widget>[
                      _add(),
                      _add(),
                      _add(),
                      _add(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(width: 1),
                      _add(),
                      _add(),
                      _add(),
                      SizedBox(width: 1),
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
}
