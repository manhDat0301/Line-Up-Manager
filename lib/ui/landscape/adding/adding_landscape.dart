import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/auto_complete_tf.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class AddingLandscape extends StatefulWidget {
  @override
  _AddingLandscapeState createState() => _AddingLandscapeState();
}

class _AddingLandscapeState extends State<AddingLandscape> {
  bool isPremierLSelect = true;
  bool isChampionshipSelect = false;
  bool isLeagueOneSelect = false;
  bool isManUSelect = true;

  GlobalKey<ScrollableAutoCompleteTextFieldState> key = GlobalKey();
  FocusNode _focusNode;
  ScrollableAutoCompleteTextField searchTf;
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      height: 50,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
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
            child: ScrollableAutoCompleteTextField(
              focusNode: _focusNode,
              controller: _textController,
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
              itemSorter: (a, b) {
                return a.toString().compareTo(b.toString());
              },
              suggestions: ['abc', 'bca', 'casc', 'tri'],
              itemSubmitted: (data) {
                setState(() {
                  searchTf.textField.controller.text = data.toString();
                });
              },
              itemFilter: (suggestion, String query) {
                return suggestion
                    .toString()
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              itemBuilder: (BuildContext context, suggestion) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(14, 10, 10, 14),
                      width: double.maxFinite,
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: suggestion.toString(),
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 14,
                    ),
                  ],
                );
              },
              key: key,
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
          ...Iterable<int>.generate([].length).map(
            (int i) => Column(
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
                        text: 'text',
                        color: Colors.black,
                        fontSize: 18,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Divider(height: 0),
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
//          ...Iterable<int>.generate(
//                  Provider.of<Data>(context).listManUPlayers.length)
//              .map(
//            (int i) => Column(
//              children: <Widget>[
//                Material(
//                  color: Colors.white,
//                  child: InkWell(
//                    onTap: () {},
//                    splashColor: Colors.orange,
//                    child: Container(
//                      alignment: Alignment.centerLeft,
//                      height: 45,
//                      child: MyText(
//                        text: 'asd',
//                        color: Colors.black,
//                        fontSize: 18,
//                      ),
//                    ),
//                  ),
//                ),
//                Divider(height: 0),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
}
