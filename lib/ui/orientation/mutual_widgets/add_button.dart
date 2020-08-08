import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/strings.dart';

class AddButton extends StatefulWidget {
  final int index;

  AddButton(this.index);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: BlocBuilder<TableBloc, TableState>(
          builder: (BuildContext context, TableState state) {
            return InkWell(
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
                context.bloc<TableBloc>().add(AddButtonPress(widget.index));
              },
            );
          },
        ),
      ),
    );
  }
}
