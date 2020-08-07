import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/position/custom_widgets/drag_player.dart';
import 'package:marozi/portrait/position/position_bloc/position_bloc.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';

class Formation extends StatefulWidget {
  @override
  _FormationState createState() => _FormationState();
}

class _FormationState extends State<Formation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      width: double.infinity,
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
