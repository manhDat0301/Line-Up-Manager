import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/drag_player.dart';

class LandscapeFormation extends StatefulWidget {
  @override
  _LandscapeFormationState createState() => _LandscapeFormationState();
}

class _LandscapeFormationState extends State<LandscapeFormation> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.72,
        height: double.infinity,
        child: Card(
          child: BlocBuilder<PositionBloc, PositionState>(
            builder: (BuildContext context, PositionState state) {
              return state is PositionSuccess
                  ? Stack(
                      children: _stackItems(state.players, state.offsets),
                    )
                  : BottomLoader();
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _stackItems(List<Player> players, List<Offset> offsets) {
    List<Widget> items = [];
    for (int i = 0; i < players.length; i++) {
      items.add(DragPlayer(i));
    }
    return items;
  }
}
