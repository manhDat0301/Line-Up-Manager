part of 'export_bloc.dart';

class ExportState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ExportInitial extends ExportState {}

class ExportFromPositionSuccess extends ExportState {
  final List<Player> players;
  final List<Offset> offsets;
  final List<String> exportTypes;
  final int currentPage;
  final String clubLogoUrl;

  ExportFromPositionSuccess({
    this.offsets,
    this.players,
    this.currentPage,
    this.exportTypes,
    this.clubLogoUrl,
  });

  ExportFromPositionSuccess copyWith({
    List<Offset> offsets,
    List<Player> players,
    List<String> exportTypes,
    int currentPage,
    String clubLogoUrl
  }) {
    return ExportFromPositionSuccess(
      offsets: offsets ?? this.offsets,
      players: players ?? this.players,
      currentPage: currentPage ?? this.currentPage,
      exportTypes: exportTypes ?? this.exportTypes,
      clubLogoUrl: clubLogoUrl ?? this.clubLogoUrl,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [offsets, players, currentPage, exportTypes, clubLogoUrl];
}
