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
  final List<String> formations;
  final int currentPage;

  PositionSuccess(
      {this.players, this.offsets, this.formations, this.currentPage});

  PositionSuccess copyWith({
    List<Player> players,
    List<Offset> offsets,
    List<String> formations,
    int currentPage,
  }) {
    return PositionSuccess(
      formations: formations ?? this.formations,
      players: players ?? this.players,
      offsets: offsets ?? this.offsets,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [players, offsets, formations, currentPage];
}
