import 'package:flutter/material.dart';
import 'package:marozi/portrait/adding/repository/adding_constants.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class FavoritePlayers extends StatefulWidget {
  @override
  _FavoritePlayersState createState() => _FavoritePlayersState();
}

class _FavoritePlayersState extends State<FavoritePlayers> {
  @override
  Widget build(BuildContext context) {
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
            color: Colors.black,
            fontSize: 18,
          ),
          onExpansionChanged: (bool) {
            setState(() {
              AddingConstants.isFavouriteExpand = bool;
            });
          },
          trailing: AddingConstants.isFavouriteExpand
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
}
