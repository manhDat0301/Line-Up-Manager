import 'package:flutter/material.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/auto_complete_tf.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class SearchPlayer extends StatefulWidget {
  @override
  _SearchPlayerState createState() => _SearchPlayerState();
}

class _SearchPlayerState extends State<SearchPlayer> {
  ScrollableAutoCompleteTextField searchTextField;

  GlobalKey<ScrollableAutoCompleteTextFieldState> acfKey =
      new GlobalKey(debugLabel: 'inputText');
  FocusNode _focusNode;
  TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    double customMinPrefixIconSize = 32;
    BoxConstraints iconConstraints = BoxConstraints(
      minWidth: customMinPrefixIconSize,
      minHeight: customMinPrefixIconSize,
    );
    return Container(
      height: 85,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorInputBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: _searchTextField2(iconConstraints),
      ),
    );
  }

  Widget _searchTextField2(iconConstraints) {
    return searchTextField = ScrollableAutoCompleteTextField(
      key: acfKey,
      controller: _textController,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 12.0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Icon(
            Icons.search,
            size: 26,
            color: Colors.black38,
          ),
        ),
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
                    fontSize: 19,
                  ),
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
    super.initState();
  }
}
