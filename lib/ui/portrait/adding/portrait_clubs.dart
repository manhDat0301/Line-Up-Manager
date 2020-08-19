import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';
import 'package:marozi/ui/portrait/adding/portrait_players.dart';

class PortraitClubs extends StatefulWidget {
  final Club club;

  PortraitClubs({Key key, this.club}) : super(key: key);

  @override
  _PortraitClubsState createState() => _PortraitClubsState();
}

class _PortraitClubsState extends State<PortraitClubs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: BlocBuilder<ClubBloc, ClubState>(
            buildWhen: (oldState, currentState) {
              if (oldState is ClubInitial) {
                return true;
              } else {
                if (oldState is ClubByLeagueState &&
                    currentState is ClubByLeagueState) {
                  if (oldState.league.id != currentState.league.id) {
                    return true;
                  }
                }
                return false;
              }
            },
            builder: (BuildContext context, ClubState state) {
              if (state is ClubByLeagueState) {
                return CustomScrollView(
                  slivers: <Widget>[
                    _topBar(state.league),
                    _clubs(state.clubs),
                  ],
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                );
              }
              return BottomLoader();
            },
          ),
        ),
      ),
    );
  }

  Widget _topBar(League league) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Stack(
          overflow: Overflow.clip,
          alignment: Alignment.centerLeft,
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.orange,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: MyText(
                text: league.name,
                color: Colors.black,
                fontSize: 21,
                isTitleCase: false,
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _clubs(List<Club> clubs) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              context.bloc<PlayerBloc>().add(GetPlayerByClub(clubs[index]));
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PortraitPlayers()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                key: Key('${index}'),
                children: <Widget>[
                  AddingImage(clubs[index].logoUrl),
                  SizedBox(width: 4),
                  Flexible(
                    fit: FlexFit.tight,
                    child: MyText(
                      text: clubs[index].name,
                      fontSize: 18,
                      color: Colors.black,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          );
        },
        childCount: clubs.length,
      ),
      itemExtent: 70.0,
    );
  }
}
