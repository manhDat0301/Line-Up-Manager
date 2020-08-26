import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';
import 'package:marozi/ui/orientation/mutual_widgets/landscape_adding_divider.dart';

class LandscapePlayers extends StatefulWidget {
  @override
  _LandscapePlayersState createState() => _LandscapePlayersState();
}

class _LandscapePlayersState extends State<LandscapePlayers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width * 0.32,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
      padding: EdgeInsets.only(left: 18, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: BlocBuilder<AddingBloc, AddingState>(
        builder: (BuildContext context, AddingState state) {
          if (state is AddingLeagueSelecting) {
            return ListView.builder(
              itemCount: state.starting.length,
              itemBuilder: (BuildContext context, int index) {
                var b = state.starting.any(
                        (player) => player.id == state.starting[index].id) ||
                    state.subs
                        .any((player) => player.id == state.starting[index].id);
                return InkWell(
                  onTap: () {
                    context
                        .bloc<AddingBloc>()
                        .add(MultiPlayerSel(state.starting[index]));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      index != 0 && index < state.starting.length
                          ? LandscapeAddingDivider()
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 6, right: 5),
                        child: Row(
                          children: <Widget>[
                            AddingImage(
                              state.starting[index].avatarUrl,
                              isPlayer: true,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: MyText(
                                text: state.starting[index].name,
                                color:
                                    b ? Colors.deepOrangeAccent : Colors.black,
                                fontSize: 15,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
