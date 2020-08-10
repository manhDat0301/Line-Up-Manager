import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      List<Offset> offsets = List.from(event.offsets);
      double halfScrW = Constants.width / 2;
      double halfScrH = Constants.height / 2;
      List<Offset> exportOffset = [
        Offset(halfScrW * 0.3, halfScrH * 0.2),
        Offset(halfScrW * 0.5 - 25, 60),
        Offset(halfScrW - 25, 80),
        Offset(halfScrW * 1.5 - 25, 60),
        Offset(halfScrW * 0.5, halfScrH * 0.5 - 40),
        Offset(halfScrW * 1.5 - 50, halfScrH * 0.5 - 40),
        Offset(halfScrW * 0.25 - 25, halfScrH * 0.55),
        Offset(halfScrW - 65, halfScrH * 0.60),
        Offset(halfScrW + 15, halfScrH * 0.60),
        Offset(halfScrW * 1.75 - 25, halfScrH * 0.55),
        Offset(halfScrW - 25, halfScrH * 0.82),
      ];

      for (int i = 0; i < offsets.length; i++) {
        offsets[i] -= Offset(22.5, -13);
      }

      yield ExportFromPositionSuccess(
        players: event.players,
        offsets: exportOffset,
        exportTypes: Constants.listExport,
        currentPage: 0,
      );
    }
  }
}
