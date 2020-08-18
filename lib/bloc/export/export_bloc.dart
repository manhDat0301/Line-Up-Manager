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
    var currentState = state;
    if (event is PositionToExport) {
      yield* event.isPortrait
          ? _mapPositionToPortraitExport(event)
          : _mapPositionToLandscapeExport(event);
    }

    if (currentState is ExportFromPositionSuccess) {
      if (event is SelectType) {
        yield currentState.copyWith(currentPage: event.select);
      }
    }
    if (event is ExportSettingDialog) {
      if (currentState is ExportFromPositionSuccess) {
        yield currentState.copyWith(
          coachName: event.coachName,
          teamName: event.teamName,
          showSubs: event.showSubs,
          showCoach: event.showCoach,
          showCaptain: event.showCaptain,
        );
      }
    }
  }

  Stream<ExportState> _mapPositionToPortraitExport(
      PositionToExport event) async* {
    final clubRepo = ClubRepository();

    String _clubUrl = await clubRepo
        .getAColOfClub(clubId: event.players[0].clubId, columns: [clubLogoUrl]);
    String _clubName = await clubRepo
        .getAColOfClub(clubId: event.players[0].clubId, columns: [clubName]);

    double width = Constants.width * 0.986;
    double height = Constants.height * 0.66;

    List<Offset> offsets = _convertToExportOffset(
      position: event.offsets,
      width: width,
      height: height,
    );

    yield ExportFromPositionSuccess(
      players: event.players,
      offsets: offsets,
      exportTypes: Constants.listExport,
      currentPage: 0,
      clubLogoUrl: _clubUrl,
      teamName: _clubName,
      subsNames: [
        'Romero',
        'Lindelof',
        'Williams',
        'Fred',
        'James',
        'Mata',
        'Ighalo',
      ],
      showCaptain: true,
      showCoach: true,
      showSubs: true,
    );
  }

  Stream<ExportState> _mapPositionToLandscapeExport(
      PositionToExport event) async* {
    final clubRepo = ClubRepository();

    String _clubUrl = await clubRepo
        .getAColOfClub(clubId: event.players[0].clubId, columns: [clubLogoUrl]);
    String _clubName = await clubRepo
        .getAColOfClub(clubId: event.players[0].clubId, columns: [clubName]);

    double width = Constants.width * 0.56;
    double height = Constants.height * 0.92;

    List<Offset> offsets = _convertToExportOffset(
        position: event.offsets, width: width, height: height);

    yield ExportFromPositionSuccess(
      players: event.players,
      offsets: offsets,
      exportTypes: Constants.listExport,
      currentPage: 0,
      clubLogoUrl: _clubUrl,
      teamName: _clubName,
      subsNames: [
        'Romero',
        'Lindelof',
        'Williams',
        'Fred',
        'James',
        'Mata',
        'Ighalo',
      ],
      showCaptain: true,
      showCoach: true,
      showSubs: true,
    );
  }

  List<Offset> _convertToExportOffset(
      {@required List<Offset> position,
        @required double width,
        @required double height}) {
    List<Offset> result = [];

    for (int i = 0; i < position.length; i++) {
      double dx;
      double dy;
      if (false) {
      } else {
        dx = position[i].dx / Constants.width * width + 5;
        dy = position[i].dy / Constants.height * height;
      }

      result.add(Offset(dx, dy));
    }

    return result;
  }
}
