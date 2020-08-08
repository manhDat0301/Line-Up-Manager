import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_league_image.dart';
import 'package:marozi/ui/portrait/adding/portrait_expansion_club.dart';

class ExpansionLeaguePortrait extends StatefulWidget {
  final League league;
  final int index;

  ExpansionLeaguePortrait({this.league, this.index});

  @override
  _ExpansionLeaguePortraitState createState() =>
      _ExpansionLeaguePortraitState();
}

class _ExpansionLeaguePortraitState extends State<ExpansionLeaguePortrait> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClubBloc>(
      create: (BuildContext context) => ClubBloc(ClubInitial()),
      child: BlocBuilder<ClubBloc, ClubState>(
        builder: (BuildContext context, ClubState state) {
          return ExpansionTile(
            key: Key('${widget.index}'),
            title: MyText(
              text: widget.league.name,
              color: null,
              fontSize: 19,
              textAlign: TextAlign.start,
            ),
            onExpansionChanged: (bool) {
              if (bool) {
                context.bloc<ClubBloc>().add(GetClubByLeague(widget.league));
              } else {}
            },
            initiallyExpanded: false,
            leading: AddingLeagueImage(widget.league),
            children: <Widget>[
              state is ClubByLeagueState
                  ? SingleChildScrollView(
                      child: Container(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.clubs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ExpansionClubPortrait(
                                club: state.clubs[index]);
                          },
                        ),
                      ),
                    )
                  : BottomLoader(),
            ],
          );
        },
      ),
    );
  }
}
