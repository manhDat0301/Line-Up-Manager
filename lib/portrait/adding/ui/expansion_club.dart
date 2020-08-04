import 'package:flutter/material.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class ExpansionClub extends StatefulWidget {
  final Club club;

  ExpansionClub({Key key, this.club}) : super(key: key);

  @override
  _ExpansionClubState createState() => _ExpansionClubState();
}

class _ExpansionClubState extends State<ExpansionClub> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool) {
//        context.bloc<ClubBloc>().add(ClubExpandEvent(club: widget.club));
      },
      leading: Icon(Icons.done),
      title: MyText(
        text: widget.club.name,
        color: null,
        textAlign: TextAlign.start,
        fontSize: 18,
        isTitleCase: true,
      ),
      children: <Widget>[Text('aaa')],
    );
  }
}
