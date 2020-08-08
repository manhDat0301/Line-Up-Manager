import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';

class PortraitTypeFormation extends StatefulWidget {
  @override
  _PortraitTypeFormationState createState() => _PortraitTypeFormationState();
}

class _PortraitTypeFormationState extends State<PortraitTypeFormation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: BlocBuilder<PositionBloc, PositionState>(
            builder: (BuildContext context, PositionState state) {
              return Card(
                  child: state is PositionSuccess
                      ? Container(
                    height: 58,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.formations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                context
                                    .bloc<PositionBloc>()
                                    .add(FormationChange(index));
                              },
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(left: 6.0),
                                  child: Text(
                                    state.formations[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: state.currentPage == index
                                          ? Colors.orange
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            index < state.offsets.length - 1
                                ? VerticalDivider()
                                : Container(),
                          ],
                        );
                      },
                    ),
                  )
                      : BottomLoader());
            },
          ),
        ),
      ],
    );
  }
}
