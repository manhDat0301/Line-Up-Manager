import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/player_bloc/player_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/strings.dart';

class AddButton extends StatefulWidget {
  final List<Player> players;
  final bool isStartingSelect;

  AddButton(this.players, this.isStartingSelect);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          splashColor: Colors.orangeAccent, // inkwell color
          child: Container(
            width: 65,
            height: 65,
            color: colorInputBackground,
            child: Icon(
              Icons.add_circle,
              color: Colors.orange,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(adding);
            context
                .bloc<PlayerBloc>()
                .add(AddButtonPress(widget.players, widget.isStartingSelect));
          },
        ),
      ),
    );
  }
}
