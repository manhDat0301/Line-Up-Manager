part of 'export_bloc.dart';

class ExportEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PositionToExport extends ExportEvent {
  final List<Player> players;
  final List<Offset> offsets;
  final bool isPortrait;

  PositionToExport(this.players, this.offsets, this.isPortrait);

  @override
  // TODO: implement props
  List<Object> get props => [players, offsets, isPortrait];
}

class SelectType extends ExportEvent {
  final int select;

  SelectType(this.select);

  @override
  // TODO: implement props
  List<Object> get props => [select];
}

class ExportSettingDialog extends ExportEvent {
  final String coachName;
  final String teamName;
  final bool showCoach;
  final bool showCaptain;
  final bool showSubs;

  ExportSettingDialog({
    this.coachName,
    this.teamName,
    this.showCoach,
    this.showCaptain,
    this.showSubs,
  });

  @override
  // TODO: implement props
  List<Object> get props => [coachName, teamName];
}
