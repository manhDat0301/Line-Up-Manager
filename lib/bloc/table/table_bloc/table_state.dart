part of 'table_bloc.dart';

class TableState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TableInitial extends TableState {}

class TableAddedSuccess extends TableState {
  final List<Player> players;
  final List<Player> subs;

  TableAddedSuccess({this.players, this.subs});

  TableAddedSuccess copyWith({
    List<Player> players,
    List<Player> subs,
  }) {
    return TableAddedSuccess(
      players: players ?? this.players,
      subs: subs ?? this.subs,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [players, subs];
}
