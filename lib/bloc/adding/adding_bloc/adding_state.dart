part of 'adding_bloc.dart';

class AddingState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddingInitial extends AddingState {
}

class LeagueByNationSuccess extends AddingState {
  final Map<String, List<League>> leagueByNation;
  final bool hasReachedMax;
  final int index;

  LeagueByNationSuccess({this.leagueByNation, this.hasReachedMax, this.index});

  LeagueByNationSuccess copyWith({
    Map<String, List<League>> leagueByNation,
    bool hasReachedMax,
    int index,
  }) {
    return LeagueByNationSuccess(
      leagueByNation: leagueByNation ?? this.leagueByNation,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      index: index ?? this.index,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [leagueByNation, hasReachedMax, index];
}

class LeagueByNationFailed extends AddingState {}
