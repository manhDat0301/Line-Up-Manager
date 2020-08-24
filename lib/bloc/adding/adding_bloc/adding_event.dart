part of 'adding_bloc.dart';

class AddingEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetLeagueByNation extends AddingEvent {}

class LeagueSelect extends AddingEvent {
  final League league;

  LeagueSelect(this.league);

  @override
  // TODO: implement props
  List<Object> get props => [league];
}

class ClubSelect extends AddingEvent {
  final Club club;

  ClubSelect(this.club);

  @override
  // TODO: implement props
  List<Object> get props => [club];
}

class TableSelect extends AddingEvent {
  final List<Player> starting;
  final List<Player> subs;
  final bool isStarting;

  TableSelect({this.starting, this.isStarting, this.subs});

  @override
  // TODO: implement props
  List<Object> get props => [starting, isStarting, subs];
}

class UpdateTable extends AddingEvent {
  final List<Player> starting;
  final List<Player> subs;

  UpdateTable({this.starting, this.subs});

  @override
  // TODO: implement props
  List<Object> get props => [starting, subs];
}

class MultiPlayerSelect extends AddingEvent {
  final Player player;

  MultiPlayerSelect(this.player);

  @override
  // TODO: implement props
  List<Object> get props => [player];
}

class ClearPlayers extends AddingEvent {}

class ClearClubs extends AddingEvent {}
