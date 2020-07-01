import 'package:flutter/material.dart';
import 'package:marozi/common/auto_complete_tf.dart';
import 'package:marozi/common/eng_clubs_vm.dart';
import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi/lib/portrait/position/repositories/constants.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/resources/colors.dart';
import 'package:provider/provider.dart';

class AddingPortrait extends StatefulWidget {
  @override
  _AddingPortraitState createState() => _AddingPortraitState();
}

class _AddingPortraitState extends State<AddingPortrait> {
  bool isFavouriteExpand = false;
  bool isPremierLeagueExpand = false;
  bool isMUExpand = false;

  GlobalKey<ScrollableAutoCompleteTextFieldState> acfKey = new GlobalKey(debugLabel: 'inputText');
  TextEditingController engClubsController = new TextEditingController();
  FocusNode _focusNode;
  ScrollableAutoCompleteTextField searchTextField;
  TextEditingController _textController;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textController.dispose();
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _textController = TextEditingController();
    _loadEngClubs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double customMinPrefixIconSize = 32;
    BoxConstraints iconConstraints = BoxConstraints(
      minWidth: customMinPrefixIconSize,
      minHeight: customMinPrefixIconSize,
    );
    return Scaffold(
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
                height: 58,
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
    );
  }

  Widget _container(Widget child, double top, {double height}) {
    return Container(
      height: height,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: top),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }

  Widget _searchPlayer(BoxConstraints iconConstraints) {
    return Container(
      decoration: BoxDecoration(
        color: colorInputBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: _searchTextField2(iconConstraints),
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

  Widget _searchTextField2(iconConstraints) {
    return searchTextField = ScrollableAutoCompleteTextField(
      key: acfKey,
      controller: _textController,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
        prefixIcon: Icon(Icons.search, size: 26),
        prefixIconConstraints: iconConstraints,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      clearOnSubmit: false,
      suggestions: Constants.playersName(),
      itemFilter: (suggestion, String query) {
        return suggestion
            .toString()
            .toLowerCase()
            .startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.toString().compareTo(b.toString());
      },
      itemSubmitted: (data) {
        setState(() {
          return searchTextField.textField.controller.text = data.toString();
        });
      },
      itemBuilder: (BuildContext context, suggestion) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.fromLTRB(14, 15, 14, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText(
                      text: suggestion.toString(),
                      color: Colors.black,
                      fontSize: 19),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              height: 5,
              thickness: 0.1,
              indent: 14,
            ),
          ],
        );
      },
    );
  }

  void _loadEngClubs() async {
    await EngClubsViewModel.loadEngClubs();
  }
}
