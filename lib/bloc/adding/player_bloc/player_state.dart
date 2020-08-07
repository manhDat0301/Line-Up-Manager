part of 'player_bloc.dart';

class PlayerState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PlayersByClub extends PlayerState {
  final List<Player> players;

  PlayersByClub({this.players});

  PlayersByClub copyWith({List<Player> players}) {
    return PlayersByClub(players: players ?? this.players);
  }

  @override
  // TODO: implement props
  List<Object> get props => [players];
}
