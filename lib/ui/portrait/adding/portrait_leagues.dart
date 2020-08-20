import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';
import 'package:marozi/ui/portrait/adding/portrait_clubs.dart';

class PortraitLeagues extends StatefulWidget {
  @override
  _PortraitLeaguesState createState() => _PortraitLeaguesState();
}

class _PortraitLeaguesState extends State<PortraitLeagues> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingBloc, AddingState>(
      buildWhen: (oldState, currentState) {
        if (oldState is AddingInitial) {
          return true;
        } else {
          if (oldState is LeagueByNationSuccess &&
              currentState is LeagueByNationSuccess) {
            if (oldState.leagueByNation != currentState.leagueByNation) {
              return true;
            }
          }
          return false;
        }
      },
      builder: (BuildContext context, AddingState state) {
        if (state is LeagueByNationSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.leagueByNation.length,
            itemBuilder: (context, i) {
              if (i < state.leagueByNation.length) {
                String nat = state.leagueByNation.keys.toList()[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
                      child: MyText(
                        text: '$nat',
                        color: Colors.black,
                        fontSize: 16,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    _buildLeagues(state.leagueByNation[nat]),
                  ],
                );
              } else {
                return Container(height: 50, child: BottomLoader());
              }
            },
          );
        } else {
          return BottomLoader();
        }
      },
    );
  }

  Widget _buildLeagues(List<League> list) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _league(index: index, league: list[index]);
          },
        ),
      ),
    );
  }

  Widget _league({League league, int index}) {
    return InkWell(
      onTap: () {
        context.bloc<ClubBloc>().add(GetClubByLeague(league));
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (BuildContext context) => PortraitClubs()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          key: Key('${index}'),
          children: <Widget>[
            AddingImage(league.logoUrl),
            SizedBox(width: 4),
            MyText(
              text: league.name,
              color: null,
              fontSize: 19,
              textAlign: TextAlign.start,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
