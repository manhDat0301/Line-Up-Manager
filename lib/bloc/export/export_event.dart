part of 'export_bloc.dart';

class ExportEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PositionToExport extends ExportEvent {
  final List<Player> players;
  final List<Offset> offsets;

  PositionToExport(this.players, this.offsets);

  @override
  // TODO: implement props
  List<Object> get props => [players, offsets];
}

class SelectType extends ExportEvent {
  final int select;

  SelectType(this.select);

  @override
  // TODO: implement props
  List<Object> get props => [select];
}
