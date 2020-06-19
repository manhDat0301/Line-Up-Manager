import 'package:flutter/material.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/portrait/adding_portrait.dart';
import 'package:marozi/resources/colors.dart';
import 'package:provider/provider.dart';

class AddingLandscape extends StatefulWidget {
  @override
  _AddingLandscapeState createState() => _AddingLandscapeState();
}

class _AddingLandscapeState extends State<AddingLandscape> {
  bool isPremierLSelect = true;
  bool isChampionshipSelect = false;
  bool isLeagueOneSelect = false;
  bool isManUSelect = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      double customIconSize = 32;
      BoxConstraints iconConstraints = BoxConstraints(
        minHeight: customIconSize,
        minWidth: customIconSize,
      );
      return Scaffold(
        backgroundColor: colorInputBackground,
        body: SafeArea(
          top: true,
          left: true,
          right: true,
          child: Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: _searchColumn(iconConstraints)),
                Expanded(child: _teamColumn()),
                Expanded(child: _playerColumn()),
              ],
            ),
          ),
        ),
      );
    } else {
      return AddingPortrait();
    }
  }

  Widget _searchColumn(iconConstraints) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _search(iconConstraints),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 5),
            child: MyText(
              text: 'England',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          _england(),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 5),
            child: MyText(
              text: 'Spain',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          _spain(),
        ],
      ),
    );
  }

  Widget _search(iconConstraints) {
    return Container(
      width: 249,
      height: 136,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorInputBackground,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 23,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                prefixIconConstraints: iconConstraints,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyText(
                    text: 'David De Gea',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  Divider(
                    thickness: 0.5,
                    height: 0.5,
                  ),
                  MyText(
                    text: 'David Silva',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _england() {
    return Container(
      width: 249,
      height: 130,
      padding: EdgeInsets.fromLTRB(28, 10, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyText(
            text: 'Premier League',
            color: isPremierLSelect ? Colors.orange : Colors.black,
            fontSize: 20,
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: MyText(
                  textAlign: TextAlign.start,
                  text: 'Championship',
                  color: isChampionshipSelect ? Colors.orange : Colors.black,
                  fontSize: 20,
                ),
              ),
              MyText(
                text: '1.99',
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                text: '\$',
                color: Colors.orange,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          Divider(
            thickness: 1,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: MyText(
                  textAlign: TextAlign.start,
                  text: 'League One',
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              MyText(
                text: '1.99',
                color: Colors.orange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              MyText(
                text: '\$',
                color: Colors.orange,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _spain() {
    return Container(
      width: 249,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/laliga.png'),
          SizedBox(width: 10),
          MyText(
            color: Colors.black,
            text: 'La Liga',
            fontSize: 18,
          ),
        ],
      ),
    );
  }

  Widget _teamColumn() {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListView(
        children: [
          ...Iterable<int>.generate(
                  Provider.of<Data>(context).listPremierLeague.length)
              .map(
            (int i) => Column(
              children: <Widget>[
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Provider.of<Data>(context, listen: false).teamSelect(
                          Provider.of<Data>(context, listen: false)
                              .listPremierLeague[i]);
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 45,
                      child: MyText(
                        text: Provider.of<Data>(context).listPremierLeague[i],
                        color:
                            Provider.of<Data>(context).listPremierLeague[i] ==
                                    Provider.of<Data>(context).teamSelected
                                ? Colors.orange
                                : Colors.black,
                        fontSize: 18,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                i < Provider.of<Data>(context).listPremierLeague.length - 1
                    ? Divider(height: 0)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _playerColumn() {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
      padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ListView(
        children: <Widget>[
          ...Iterable<int>.generate(
                  Provider.of<Data>(context).listManUPlayers.length)
              .map((int i) => Column(
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.orange,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 45,
                            child: MyText(
                              text: Provider.of<Data>(context).teamSelected ==
                                      'Manchester United'
                                  ? Provider.of<Data>(context)
                                      .listManUPlayers[i]
                                  : '',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      i <
                              Provider.of<Data>(context)
                                      .listPremierLeague
                                      .length -
                                  1
                          ? Divider(height: 0)
                          : Container(),
                    ],
                  )),
        ],
      ),
    );
  }
}
