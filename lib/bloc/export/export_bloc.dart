import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/club/club_repository.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/repository/constants.dart';

part 'export_event.dart';

part 'export_state.dart';

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  ExportBloc(ExportState initialState) : super(initialState);

  @override
  Stream<ExportState> mapEventToState(ExportEvent event) async* {
    if (event is ExportFromPosition) {
      final clubRepo = ClubRepository();
      String _clubUrl = await clubRepo.getAColOfClub(
          clubId: event.players[0].clubId, columns: [clubLogoUrl]);
      String _clubName = await clubRepo.getAColOfClub(
          clubId: event.players[0].clubId, columns: [clubName]);
      print(_clubName);

      double halfWidgetWidth =
          Constants.width * 0.18 * 0.5; // 37.02857142857143
      double halfWidgetHeight =
          Constants.width * 0.157 * 0.5; // 32.29714285714286

      List<Offset> list = _exportOffset(
        position: event.offsets,
        halfWidgetHeight: halfWidgetHeight,
        halfWidgetWidth: halfWidgetWidth,
      );

      yield ExportFromPositionSuccess(
        players: event.players,
        offsets: list,
        exportTypes: Constants.listExport,
        currentPage: 0,
        clubLogoUrl: _clubUrl,
        clubName: _clubName,
      );
    }
  }

  List<Offset> _exportOffset({
    List<Offset> position,
    double halfWidgetWidth,
    double halfWidgetHeight,
  }) {
    List<Offset> result = [];

    double width = Constants.width * 0.9;
    double height = Constants.height * 0.705;

    for (int i = 0; i < position.length; i++) {
      double dx;
      double dy;
      if (false) {
      } else {
        dx = position[i].dx / Constants.width * width;
        dy = position[i].dy / Constants.height * height;
      }

      result.add(Offset(dx, dy));
    }

    return result;
  }
}
