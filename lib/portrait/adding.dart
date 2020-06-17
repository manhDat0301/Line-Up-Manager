import 'package:flutter/material.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/landscape/adding.dart';
import 'package:marozi/resources/colors.dart';
import 'package:provider/provider.dart';

class Adding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayerAdding();
  }
}

class PlayerAdding extends StatefulWidget {
  @override
  _PlayerAddingState createState() => _PlayerAddingState();
}

class _PlayerAddingState extends State<PlayerAdding> {
  bool isFavouriteExpand = false;
  bool isPremierLeagueExpand = false;
  bool isMUExpand = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print(
          "adding: ${Provider.of<Data>(context, listen: false).listManUPlayers[0]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      double customMinPrefixIconSize = 32;
      BoxConstraints iconConstraints = BoxConstraints(
        minWidth: customMinPrefixIconSize,
        minHeight: customMinPrefixIconSize,
      );
      return ChangeNotifierProvider(
        create: (BuildContext context) => Data(),
        builder: (context, widget) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: colorInputBackground,
              body: SafeArea(
                top: true,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    padding: EdgeInsets.only(left: 6, right: 6),
                    children: <Widget>[
                      _container(
                        _searchPlayer(iconConstraints),
                        12,
                        height: 243,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: MyText(
                            textAlign: TextAlign.start,
                            text: 'Favourite players',
                            color: Colors.black,
                            fontSize: 16),
                      ),
                      _favouritePlayer(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: MyText(
                          text: 'England',
                          color: Colors.black,
                          fontSize: 16,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      _england(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: MyText(
                          text: 'Spain',
                          color: Colors.black,
                          fontSize: 16,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      _laliga(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return PlayerAddingLandscape();
    }
  }

  Widget _container(Widget child, double top, {double height}) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: top),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  Widget _searchPlayer(BoxConstraints iconConstraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 13),
          decoration: BoxDecoration(
            color: colorInputBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IntrinsicHeight(
            child: Theme(
              data: Theme.of(context).copyWith(splashColor: Colors.transparent),
              child: TextFormField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                  prefixIcon: Icon(Icons.search, size: 26),
                  prefixIconConstraints: iconConstraints,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: (0.09 * MediaQuery.of(context).size.width),
              top: 18,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText(text: 'David De Gea', color: Colors.black, fontSize: 19),
                Divider(
                  color: Colors.black,
                  thickness: 0.1,
                  height: 0,
                ),
                MyText(text: 'David Silva', color: Colors.black, fontSize: 19),
                Divider(
                  color: Colors.black,
                  thickness: 0.1,
                  height: 0,
                ),
                MyText(text: 'David Villa', color: Colors.black, fontSize: 19),
                Divider(
                  color: Colors.black,
                  thickness: 0.1,
                  height: 0,
                ),
                MyText(
                    text: 'Davide Santon', color: Colors.black, fontSize: 19),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _favouritePlayer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {},
        child: ExpansionTile(
          title: MyText(
            textAlign: TextAlign.start,
            text: '34 players',
            color: isFavouriteExpand ? Colors.orange : Colors.black,
            fontSize: 18,
          ),
          onExpansionChanged: (bool) {
            setState(() {
              isFavouriteExpand = bool;
            });
          },
          trailing: isFavouriteExpand
              ? Icon(Icons.keyboard_arrow_up)
              : Icon(Icons.keyboard_arrow_down),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: double.infinity,
                    child: MyText(
                      text: 'Harry Maguire',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 0.1,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: double.infinity,
                    child: MyText(
                      text: 'Martial',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 0.1,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    width: double.infinity,
                    child: MyText(
                      text: 'Pogba',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _england() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: ExpansionTile(
        title: MyText(
          text: 'Premier League',
          color: isPremierLeagueExpand ? Colors.orange : Colors.black,
          fontSize: 19,
          textAlign: TextAlign.start,
        ),
        onExpansionChanged: (bool) {
          setState(() {
            isPremierLeagueExpand = bool;
          });
        },
        initiallyExpanded: isPremierLeagueExpand,
        trailing: isPremierLeagueExpand
            ? Icon(Icons.keyboard_arrow_up)
            : Icon(Icons.keyboard_arrow_down),
        leading: Image.asset('assets/images/premier.png'),
        children: <Widget>[
          _manU(),
        ],
      ),
    );
  }

  Widget _manU() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ExpansionTile(
        title: MyText(
          text: 'Manchester United',
          color: isMUExpand ? Colors.orange : Colors.black,
          textAlign: TextAlign.start,
          fontSize: 18,
        ),
        onExpansionChanged: (bool) {
          setState(() {
            isMUExpand = bool;
          });
        },
        initiallyExpanded: isMUExpand,
        leading: Image.asset('assets/images/mu2.png'),
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.only(bottom: 10),
            child: ListView(
              children: [
                ...Iterable<int>.generate(
                        Provider.of<Data>(context).listManUPlayers.length)
                    .map(
                  (i) => Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.orange,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.73,
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              text:
                                  Provider.of<Data>(context).listManUPlayers[i],
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      i < Provider.of<Data>(context).listManUPlayers.length - 1
                          ? Divider(
                              indent: 60,
                              color: Colors.black,
                              thickness: 0.1,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _laliga() {
    return _container(
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 17.0, left: 5),
            child: Image.asset('assets/images/laliga.png'),
          ),
          Expanded(
            child: MyText(
              text: 'La Liga',
              color: Colors.black,
              fontSize: 19,
              textAlign: TextAlign.start,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyText(
                text: '1.99',
                color: Colors.orange,
                fontSize: 19,
              ),
              MyText(
                text: '\$',
                color: Colors.orange,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
      5,
    );
  }
}
