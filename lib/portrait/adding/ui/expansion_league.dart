
import 'package:flutter/material.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/portrait/adding/ui/expansion_club.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class ExpansionLeague extends StatefulWidget {
  final List<League> leagues;
  final int listIndex;
  final String nation;

  ExpansionLeague({this.leagues, this.listIndex, this.nation, key})
      : super(key: key);

  @override
  _ExpansionLeagueState createState() => _ExpansionLeagueState();
}

class _ExpansionLeagueState extends State<ExpansionLeague> {
//  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  int selected = -1;
  String nation = '';

  @override
  void initState() {
    super.initState();
//    _scrollController..addListener(() => _scrollListener);
  }

  void _scrollListener() {}

  @override
  void dispose() {
    super.dispose();
//    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
//      controller: _scrollController,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
//          key: Key('${nation}${(selected).toString()}'),
          itemCount: widget.leagues.length,
          itemBuilder: (context, index) {
            return _leagueWidget(index, widget.leagues[index]);
          },
        ),
      ),
    );
  }

  Widget _leagueWidget(int index, League league) {
    return ExpansionTile(
      key: Key('${index}'),
      title: MyText(
        text: league.name,
        color: null,
        fontSize: 19,
        textAlign: TextAlign.start,
      ),
      onExpansionChanged: (bool) {
        if (bool) {
        } else {
        }
      },
      initiallyExpanded:
      selected == index && nation == widget.nation ? true : false,
      leading: Image.asset('assets/images/premier.png'),
      children: <Widget>[
        Container(
          height: 180,
          child: SingleChildScrollView(
            child: Column(
              children: _buildListClub([], league),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildListClub(List<Club> list, League league) {
    return Iterable<int>.generate(list.length)
        .map(
          (i) => ExpansionClub(club: list[i]),
    )
        .toList();
  }
}
