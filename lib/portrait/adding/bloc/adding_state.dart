part of 'adding_bloc.dart';

class AddingState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddingInitial extends AddingState {

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class LeagueByNationInitial extends AddingState {
  final Map<String, List<League>> leagueByNation;

  LeagueByNationInitial({this.leagueByNation});

  LeagueByNationInitial copyWith({Map<String, List<League>> leagueByNation}) {
    return LeagueByNationInitial(leagueByNation: leagueByNation ?? this.leagueByNation);
  }

  @override
  // TODO: implement props
  List<Object> get props => [leagueByNation];
}
