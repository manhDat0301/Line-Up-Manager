part of 'adding_bloc.dart';

class AddingState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddingInitial extends AddingState {
  final Map<String, List<League>> leagueByNation;

  AddingInitial({this.leagueByNation});

  AddingInitial copyWith({Map<String, List<League>> leagueByNation}) {
    return AddingInitial(leagueByNation: leagueByNation ?? this.leagueByNation);
  }

  @override
  // TODO: implement props
  List<Object> get props => [leagueByNation];
}
