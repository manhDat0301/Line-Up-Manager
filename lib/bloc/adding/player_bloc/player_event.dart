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

class MultiSelectPlayer extends PlayerEvent {
  final Player player;

  MultiSelectPlayer(this.player);

  @override
  // TODO: implement props
  List<Object> get props => [player];
}

class AddButtonPress extends PlayerEvent {
  final List<Player> playersSelected;
  final bool isStartingSelect;

  AddButtonPress(this.playersSelected, this.isStartingSelect);

  @override
  // TODO: implement props
  List<Object> get props => [playersSelected, isStartingSelect];
}
