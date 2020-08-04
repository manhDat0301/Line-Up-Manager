import 'package:flutter/material.dart';
import 'package:marozi/portrait/adding/repository/adding_constants.dart';
import 'package:marozi/portrait/adding/ui/expansion_league.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class Nations extends StatefulWidget {
  @override
  _NationsState createState() => _NationsState();
}

class _NationsState extends State<Nations> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.0),
                  child: MyText(
                    text: '${AddingConstants.key}',
                    color: Colors.black,
                    fontSize: 16,
                    textAlign: TextAlign.start,
                  ),
                ),
                ExpansionLeague(
                  leagues: [],
                  nation: 'nat',
                  listIndex: i,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
