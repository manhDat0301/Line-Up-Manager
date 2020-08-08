part of 'adding_bloc.dart';

class AddingEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetLeagueByNation extends AddingEvent {}

class LeagueSelect extends AddingEvent {
  final int index;

  LeagueSelect(this.index);

  @override
  // TODO: implement props
  List<Object> get props => [index];
}
