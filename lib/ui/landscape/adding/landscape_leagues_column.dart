import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/club_bloc/club_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';

class LandscapeLeaguesColumn extends StatefulWidget {
  final League league;

  LandscapeLeaguesColumn(this.league);

  @override
  _LandscapeLeaguesColumnState createState() => _LandscapeLeaguesColumnState();
}

class _LandscapeLeaguesColumnState extends State<LandscapeLeaguesColumn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubBloc, ClubState>(
      builder: (BuildContext context, ClubState state) {
        return InkWell(
          onTap: () {
            context.bloc<ClubBloc>().add(GetClubByLeague(widget.league));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: AddingImage(widget.league.logoUrl),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: BlocBuilder<ClubBloc, ClubState>(
                    builder: (BuildContext context, ClubState state) {
                      return MyText(
                        text: widget.league.name,
                        color: state is ClubByLeagueSuccess &&
                                state.league.id == widget.league.id
                            ? Colors.deepOrangeAccent
                            : Colors.black,
                        fontSize: 16,
                        textAlign: TextAlign.start,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
