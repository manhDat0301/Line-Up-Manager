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
  final Club club;

  PlayersByClub({this.players, this.club});

  PlayersByClub copyWith({
    List<Player> players,
    Club club,
  }) {
    return PlayersByClub(
      players: players ?? this.players,
      club: club ?? this.club,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [players, club];
}
