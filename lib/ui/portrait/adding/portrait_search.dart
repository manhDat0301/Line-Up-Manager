import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> queryResultSet;
  List<String> tempSearchStore= ['aaa', 'aaaaaa'];

  initiateSearch(String value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    if (queryResultSet.length == 0 && value.length == 1) {
      SearchService().searchByName(value).then((QuerySnapshot documents) {
        print('##### ${documents.docs}');
        for (int i = 0; i < documents.docs.length; i++) {
          queryResultSet.add(documents.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((Map<String, dynamic> element) {
//        if (element['player_name'].startsWith(value.substring(0))) {
        tempSearchStore.add(element['player_name']);
//        }
      });
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textController.dispose();
  }

  @override
  void initState() {
//    tempSearchStore = ['aaa', 'aaaaaa'];
    queryResultSet = [];
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
    return SearchWidget(
      listContainerHeight: 300,
      onItemSelected: (String selected) {
        print('##### onItemSelected');
      },
      dataList: tempSearchStore,
      hideSearchBoxWhenItemSelected: false,
      noItemsFoundWidget: Container(
        child: Center(child: Text('No players match')),
      ),
      textFieldBuilder:
          (TextEditingController controller, FocusNode focusNode) {
        return _textField();
      },
      selectedItemBuilder: (item, void Function() deleteSelectedItem) {
        return Container();
      },
      queryBuilder: (String query, List<String> list) {
        return list
            .where((String name) =>
                name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      popupListItemBuilder: (String item) {
        print('##### $item');
        return _popupList(item);
      },
    );
  }

  Widget _textField() {
    double customMinPrefixIconSize = 32;
    BoxConstraints iconConstraints = BoxConstraints(
      minWidth: customMinPrefixIconSize,
      minHeight: customMinPrefixIconSize,
    );
    return TextField(
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
    );
  }

  Widget _popupList(String item) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Text(
        item,
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
        ;
      },
      itemSubmitted: (data) {
        setState(() {
          tempSearchStore = ['bncas', 'asddcv', 'aaasdd'];
        });
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
