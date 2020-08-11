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

      List<Offset> exportOffset = [];
      List<List<double>> list = _percent(event.offsets);
      List<Offset> exportPer = [
        Offset(0.9326599326599326, 14.4),
        Offset(0.5446428571428571, 2.1599999999999997),
        Offset(0.9486301369863014, 1.6199999999999999),
        Offset(0.9929460580912863, 2.1599999999999997),
        Offset(1.0244186046511627, 1.7485714285714287),
        Offset(0.8611374407582938, 1.7485714285714287),
        Offset(0.1346153846153846, 1.6114285714285712),
        Offset(0.8650943396226415, 1.565217391304348),
        Offset(0.9324607329842932, 1.565217391304348),
        Offset(0.995940959409594, 1.6114285714285712),
        Offset(0.9486301369863014, 1.5709090909090908),
      ];
      for (int i = 0; i < event.offsets.length; i++) {
        double dxPer = event.offsets[i].dx / list[0][i];
        double dyPer = event.offsets[i].dy / list[1][i];
        exportOffset.add(Offset(dxPer, dyPer));
      }

      double halfWidth = 342 * 0.5;
      double halfHeight = 396 * 0.5;

      List<Offset> export = [
        Offset(148.5, 1.5),
        Offset(56.0, 60.0),
        Offset(146.0, 80),
        Offset(241.0, 60.0),
        Offset(86.0, 140.0),
        Offset(211.0, 140.0),
        Offset(26.0, 210.0),
        Offset(106.0, 230.0),
        Offset(191.0, 230.0),
        Offset(271.0, 210.0),
        Offset(146.0, 300),
      ];
      print('exportOffset: ${exportOffset}');

      yield ExportFromPositionSuccess(
        players: event.players,
        offsets: exportOffset,
        exportTypes: Constants.listExport,
        currentPage: 0,
      );
    }
  }

  List<List<double>> _percent(List<Offset> positionIn) {
    List<Offset> position = [
      Offset(138.5, 21.6),
      Offset(30.5, 129.6),
      Offset(138.5, 129.6),
      Offset(239.3, 129.6),
      Offset(88.1, 244.8),
      Offset(181.7, 244.8),
      Offset(3.5, 338.4),
      Offset(91.7, 360.0),
      Offset(178.1, 360.0),
      Offset(269.9, 338.4),
      Offset(138.5, 475.2),
    ];

    List<Offset> export = [
      Offset(148.5, 1.5),
      Offset(56.0, 60.0),
      Offset(146.0, 80),
      Offset(241.0, 60.0),
      Offset(86.0, 140.0),
      Offset(211.0, 140.0),
      Offset(26.0, 210.0),
      Offset(106.0, 230.0),
      Offset(191.0, 230.0),
      Offset(271.0, 210.0),
      Offset(146.0, 295),
    ];

    List<List<double>> after = [];
    List<double> listDxPer = [];
    List<double> listDyPer = [];
    for (int i = 0; i < export.length; i++) {
      double dxPer = position[i].dx / export[i].dx;
      double dyPer = position[i].dy / export[i].dy;
      listDxPer.add(dxPer);
      listDyPer.add(dyPer);
    }
    after.add(listDxPer);
    after.add(listDyPer);
    return after;
  }
}
