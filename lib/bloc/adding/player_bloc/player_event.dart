part of 'player_bloc.dart';

class PlayerEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TableUpdate extends PlayerEvent {
  final bool isStarting;
  final List<Player> starting;
  final List<Player> subs;

  TableUpdate({this.isStarting, this.starting, this.subs});

  @override
  // TODO: implement props
  List<Object> get props => [isStarting, starting, subs];
}

class MultiPlayerSelect extends PlayerEvent {
  final Player player;

  MultiPlayerSelect(this.player);

  @override
  // TODO: implement props
  List<Object> get props => [player];
}
