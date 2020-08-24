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

class SelectedList extends PlayerEvent {
  final List<Player> playersSelected;
  final bool isStartingSelect;

  SelectedList({this.playersSelected, this.isStartingSelect});

  @override
  // TODO: implement props
  List<Object> get props => [playersSelected, isStartingSelect];
}
