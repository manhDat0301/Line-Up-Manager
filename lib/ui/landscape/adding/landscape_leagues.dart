import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';

class LandscapeLeagues extends StatefulWidget {
  final League league;

  LandscapeLeagues(this.league);

  @override
  _LandscapeLeaguesState createState() => _LandscapeLeaguesState();
}

class _LandscapeLeaguesState extends State<LandscapeLeagues> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddingBloc, AddingState>(
      builder: (BuildContext context, AddingState state) {
        return InkWell(
          onTap: () {
            context.bloc<AddingBloc>().add(LeagueSelect(widget.league));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: AddingImage(widget.league.logoUrl),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: MyText(
                    text: widget.league.name,
                    color: state is AddingLeagueSelecting &&
                            state.leagueByNation['a'] != null &&
                            state.leagueByNation['a'][0].id == widget.league.id
                        ? Colors.deepOrangeAccent
                        : Colors.black,
                    fontSize: 16,
                    textAlign: TextAlign.start,
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
