import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/auto_complete_tf.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class LandscapePlayersSearch extends StatefulWidget {
  @override
  _LandscapePlayersSearchState createState() => _LandscapePlayersSearchState();
}

class _LandscapePlayersSearchState extends State<LandscapePlayersSearch> {
  FocusNode _focusNode;
  ScrollableAutoCompleteTextField searchTf;
  TextEditingController _textController;
  GlobalKey<ScrollableAutoCompleteTextFieldState> key = GlobalKey();

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
    key.currentState.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double customIconSize = 32;
    BoxConstraints iconConstraints = BoxConstraints(
      minHeight: customIconSize,
      minWidth: customIconSize,
    );
    return Container(
      width: MediaQuery.of(context).size.width * 0.33,
      height: 55,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(17, 10, 10, 0),
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
}
