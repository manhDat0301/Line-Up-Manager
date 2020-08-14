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
    if (event is PositionToExport) {
      yield* event.isPortrait
          ? _mapPositionToGloryRed(event)
          : _mapPositionToGloryBlue(event);
    }
    if (event is SelectType) {
      var currentState = state;
      if (currentState is ExportFromPositionSuccess) {
        yield currentState.copyWith(currentPage: event.select);
      }
    }
  }

  Stream<ExportState> _mapPositionToGloryRed(PositionToExport event) async* {
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
      clubName: _clubName,
      subsName: [
        'Romero',
        'Lindelof',
        'Williams',
        'Fred',
        'James',
        'Mata',
        'Ighalo',
      ],
    );
  }

  Stream<ExportState> _mapPositionToGloryBlue(PositionToExport event) async* {
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
      clubName: _clubName,
      subsName: [
        'Romero',
        'Lindelof',
        'Williams',
        'Fred',
        'James',
        'Mata',
        'Ighalo',
      ],
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
