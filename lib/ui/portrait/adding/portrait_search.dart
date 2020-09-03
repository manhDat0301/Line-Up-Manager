import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/auto_complete_tf.dart';
import 'package:marozi/ui/orientation/mutual_widgets/my_search_widget.dart';
import 'package:marozi/utils/search_service.dart';

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
  List<Player> searchList;
  Future<QuerySnapshot> future;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textController.dispose();
  }

  @override
  void initState() {
    searchList = [];
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

  initiateSearch(String query) {
    future = SearchService().searchByName(query);
    future.then((value) => value.docs.forEach((element) {}));
    //   ..then((snapShot) {
    //   for (var element in snapShot.docs) {
    //     var player =
    //         Player(name: element.data()['player_name'], id: element.id);
    //     if (!searchList.any((existedPlayer) => existedPlayer.id == player.id)) {
    //       searchList.add(player);
    //     }
    //   }
    // });
  }

  Widget _searchWidget() {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MySearchWidget<Player>(
            onItemSelected: (Player selected) {},
            dataList: searchList,
            listContainerHeight: MediaQuery.of(context).size.height * 0.4,
            listContainerWidth: MediaQuery.of(context).size.width * 0.4,
            hideSearchBoxWhenItemSelected: false,
            noItemsFoundWidget: Container(
              child: Center(child: Text('No player match')),
            ),
            textFieldBuilder:
                (TextEditingController controller, FocusNode focusNode) {
              return _textField(controller, focusNode);
            },
            selectedItemBuilder: (item, void Function() deleteSelectedItem) {
              return Container();
            },
            queryBuilder: (String query, List<Player> list) {
              print('###### ${query}');
              initiateSearch(query);
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
        return MySearchWidget<Player>(
          onItemSelected: (Player selected) {},
          dataList: [],
          listContainerHeight: MediaQuery.of(context).size.height * 0.4,
          listContainerWidth: MediaQuery.of(context).size.width * 0.4,
          hideSearchBoxWhenItemSelected: false,
          noItemsFoundWidget: Container(
            child: Center(child: Text('No player match')),
          ),
          textFieldBuilder:
              (TextEditingController controller, FocusNode focusNode) {
            return _textField(controller, focusNode);
          },
          selectedItemBuilder: (item, void Function() deleteSelectedItem) {
            return Container();
          },
          queryBuilder: (String query, List<Player> list) {
            initiateSearch(query);
            return list
                .where((Player player) =>
                    player.name.toLowerCase().contains(query.toLowerCase()))
                .toList();
          },
          popupListItemBuilder: (Player player) {
            return _popupList(player);
          },
        );
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
}
