part of 'table_bloc.dart';

class TableState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TableInitial extends TableState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PlayerAdded extends TableState {
  final Map<int, Player> map;

  PlayerAdded({this.map});

  PlayerAdded copyWith({Map<int, Player> map}) {
    return PlayerAdded(map: map ?? this.map);
  }

  @override
  // TODO: implement props
  List<Object> get props => [map];
}
