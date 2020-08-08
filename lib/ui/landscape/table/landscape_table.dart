import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/position/position_bloc/position_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/ui/landscape/table/landscape_starting.dart';
import 'package:marozi/ui/landscape/table/landscape_substitutes.dart';
import 'package:marozi/ui/orientation/mutual_widgets/add_button.dart';
import 'package:marozi/ui/orientation/mutual_widgets/garbage_can.dart';
import 'package:marozi/ui/orientation/mutual_widgets/table_player_image.dart';
import 'package:marozi/utils/firestore_service.dart';

class LandscapePlayerTable extends StatefulWidget {
  @override
  _LandscapePlayerTableState createState() => _LandscapePlayerTableState();
}

class _LandscapePlayerTableState extends State<LandscapePlayerTable> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: colorInputBackground,
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: [
            _topBar(),
            _center(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(),
        MyText(
          text: 'Adding Players',
          color: Colors.black,
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
        BlocBuilder<TableBloc, TableState>(
          builder: (BuildContext context, TableState state) {
            return InkWell(
              onTap: () {
                if (state is PlayerAdded) {
                  if (state.map.isEmpty) {
                    _showSnackBar();
                  } else {
                    int start = 0;
                    int subs = 0;
                    for (int i = 0; i < 18; i++) {
                      if (i <= 10 && state.map.containsKey(i)) {
                        start++;
                      }
                      if (10 < i && i < 18 && state.map.containsKey(i)) {
                        subs++;
                      }
                    }
                    if (start + subs < 8) {
                      _showSnackBar();
                    } else {
                      context
                          .bloc<PositionBloc>()
                          .add(CreateFormation(state.map.values.toList()));
                      Navigator.pushNamed(context, position);
                    }
                  }
                } else {
                  _showSnackBar();
                }
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _center() {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GarbageCan(),
          LandscapeStarting(),
          LandscapeSubstitutes(),
        ],
      ),
    );
  }


  void _showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Need at least 5 Starting and 3 Substitutes'),
    ));
  }
}
