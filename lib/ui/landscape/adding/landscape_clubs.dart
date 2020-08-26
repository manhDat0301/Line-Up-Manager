import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/adding_bloc/adding_bloc.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/mutual_widgets/adding_image.dart';
import 'package:marozi/ui/orientation/mutual_widgets/landscape_adding_divider.dart';

class LandscapeClubs extends StatefulWidget {
  @override
  _LandscapeClubsState createState() => _LandscapeClubsState();
}

class _LandscapeClubsState extends State<LandscapeClubs> {
  @override
  Widget build(BuildContext context) {
    return _teamColumn();
  }

  Widget _teamColumn() {
    return Expanded(
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
        padding: EdgeInsets.only(left: 18, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: BlocBuilder<AddingBloc, AddingState>(
          builder: (BuildContext context, AddingState state) {
            if (state is AddingLeagueSelecting) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.starting.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
//                      context
//                          .bloc<AddingBloc>()
//                          .add(ClubSelect(state.starting[index]));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        index != 0 && index < state.starting.length
                            ? LandscapeAddingDivider()
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 6.5),
                          child: Row(
                            children: <Widget>[
                              AddingImage(state.starting[index].avatarUrl),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 6),
                                  child: MyText(
                                    text: state.starting[index].name,
//                                    color: state.club != null &&
//                                            state.club.id ==
//                                                state.starting[index].id
//                                        ? Colors.deepOrangeAccent
//                                        : Colors.black,
                                    fontSize: 15,
                                    textAlign: TextAlign.start,
                                  ),
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
      ),
    );
  }
}
