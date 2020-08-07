part of 'player_bloc.dart';

class PlayerEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetPlayerByClub extends PlayerEvent {
  final Club club;

  GetPlayerByClub(this.club);

  @override
  // TODO: implement props
  List<Object> get props => [club];
}
