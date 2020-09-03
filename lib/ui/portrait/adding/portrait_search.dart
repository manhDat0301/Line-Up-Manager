import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/auto_complete_tf.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/utils/search_service.dart';
import 'package:search_widget/search_widget.dart';

class PortraitSearch extends StatefulWidget {
  @override
  _PortraitSearchState createState() => _PortraitSearchState();
}

class _PortraitSearchState extends State<PortraitSearch> {
  ScrollableAutoCompleteTextField searchTextField;

  GlobalKey<ScrollableAutoCompleteTextFieldState> acfKey =
      new GlobalKey(debugLabel: 'inputText');
  FocusNode _focusNode;
  TextEditingController _textController;
  Stream streamQuery;
  Future<QuerySnapshot> futureSearchResults;
  List<Player> tempSearchStore;

  initiateSearch(String value) {
    if (value.length == 0) {
      setState(() {
        tempSearchStore = [];
      });
    }
    SearchService().searchByName(value).then((QuerySnapshot documents) {
      print('##### ${documents.docs}');
      for (int i = 0; i < documents.docs.length; i++) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textController.dispose();
  }

  @override
  void initState() {
    tempSearchStore = [];
    _focusNode = FocusNode();
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colorScaffoldBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: _searchWidget(),
      ),
    );
  }

  Widget _searchWidget() {
    return SearchWidget<Player>(
      onItemSelected: (Player selected) {},
      dataList: tempSearchStore,
      listContainerHeight: MediaQuery.of(context).size.height * 0.4,
      hideSearchBoxWhenItemSelected: false,
      noItemsFoundWidget: Container(
        child: Center(child: Text('No players match')),
      ),
      textFieldBuilder:
          (TextEditingController controller, FocusNode focusNode) {
        return _textField(controller, focusNode);
      },
      selectedItemBuilder: (item, void Function() deleteSelectedItem) {
        return Container();
      },
      queryBuilder: (String query, List<Player> list) {
        // setState(() {
        // });
        // SearchService().searchByName(query).then((QuerySnapshot documents) {
        //
        //   for (int i = 0; i < documents.docs.length; i++) {
        //     queryResultSet.add(documents.docs[i].data());
        //   }
        // });
        return list
            .where((Player player) =>
            player.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      popupListItemBuilder: (Player player) {
        return _popupList(player);
      },
    );
  }

  Widget _textField(TextEditingController controller, FocusNode focusNode) {
    double customMinPrefixIconSize = 32;
    BoxConstraints iconConstraints = BoxConstraints(
      minWidth: customMinPrefixIconSize,
      minHeight: customMinPrefixIconSize,
    );
    return TextField(
      controller: controller,
      focusNode: focusNode,
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
        // suffixIcon: IconButton(
        //   padding: EdgeInsets.all(0.0),
        //   constraints: iconConstraints,
        //   icon: Icon(Icons.clear, color: Colors.black),
        //   onPressed: () {
        //     controller.clear();
        //   },
        // ),
        suffixIconConstraints: iconConstraints,
        prefixIconConstraints: iconConstraints,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }

  Widget _popupList(Player player) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        player.name,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _searchTextField() {
    double customMinPrefixIconSize = 32;
    BoxConstraints iconConstraints = BoxConstraints(
      minWidth: customMinPrefixIconSize,
      minHeight: customMinPrefixIconSize,
    );
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
      clearOnSubmit: true,
      textChanged: (val) {
//        initiateSearch(val);
      },
      suggestions: tempSearchStore,
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
        print('itemSubmitted $data');
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
}
