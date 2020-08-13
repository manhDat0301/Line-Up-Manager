part of 'position_bloc.dart';

class PositionState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PositionInitial extends PositionState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PositionSuccess extends PositionState {
  final List<Player> players;
  final List<Offset> offsets;
  final List<String> listFormations;
  final int currentPage;
  final String formation;
  final bool isPortrait;

  PositionSuccess({
    this.players,
    this.offsets,
    this.listFormations,
    this.currentPage,
    this.formation,
    this.isPortrait,
  });

  PositionSuccess copyWith({
    List<Player> players,
    List<Offset> offsets,
    List<String> listFormations,
    int currentPage,
    String formation,
    bool isPortrait,
  }) {
    return PositionSuccess(
      listFormations: listFormations ?? this.listFormations,
      players: players ?? this.players,
      offsets: offsets ?? this.offsets,
      currentPage: currentPage ?? this.currentPage,
      formation: formation ?? this.formation,
      isPortrait: isPortrait ?? this.isPortrait,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props =>
      [players, offsets, listFormations, currentPage, formation, isPortrait];
}
