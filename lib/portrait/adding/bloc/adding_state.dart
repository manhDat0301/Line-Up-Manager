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

class LeagueByNationSuccess extends AddingState {
  final Map<String, List<League>> leagueByNation;
  final bool hasReachedMax;

  LeagueByNationSuccess({this.leagueByNation, this.hasReachedMax});

  LeagueByNationSuccess copyWith({
    Map<String, List<League>> leagueByNation,
    bool hasReachedMax,
  }) {
    return LeagueByNationSuccess(
      leagueByNation: leagueByNation ?? this.leagueByNation,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [leagueByNation, hasReachedMax];
}

class LeagueByNationFailed extends AddingState {

}