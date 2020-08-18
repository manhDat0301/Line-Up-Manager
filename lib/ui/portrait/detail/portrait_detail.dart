import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/portrait/detail/portrait_player_info.dart';
import 'package:marozi/ui/portrait/detail/portrait_player_stat.dart';

import 'file:///C:/Users/ADMIN/AndroidStudioProjects/marozi-flutter/lib/bloc/detail/detail_bloc.dart';

class PortraitPlayerDetail extends StatefulWidget {
  final String playerId;

  PortraitPlayerDetail(this.playerId);

  @override
  _PortraitPlayerDetailState createState() => _PortraitPlayerDetailState();
}

class _PortraitPlayerDetailState extends State<PortraitPlayerDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailBloc>(
      create: (BuildContext context) =>
          DetailBloc(DetailInitial())..add(DetailFetch(widget.playerId)),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorInputBackground,
        body: SafeArea(
          top: true,
          child: BlocBuilder<DetailBloc, DetailState>(
            builder: (BuildContext context, DetailState state) {
              if (state is DetailedLoadSuccess) {
                return Column(
                  children: <Widget>[
                    _topBar(),
                    PlayerInfo(state.player, state.clubImageUrl),
                    PlayerStat(state.player),
                  ],
                );
              }
              return BottomLoader();
            },
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: Colors.orange,
          ),
          SizedBox(width: 8),
          BlocBuilder<DetailBloc, DetailState>(
            builder: (BuildContext context, DetailState state) {
              if (state is DetailedLoadSuccess) {
                return MyText(
                    text: state.player.name, color: Colors.black, fontSize: 20);
              }
              return BottomLoader();
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
