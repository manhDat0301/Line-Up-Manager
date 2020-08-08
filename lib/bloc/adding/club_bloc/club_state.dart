part of 'club_bloc.dart';

class ClubState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClubInitial extends ClubState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClubByLeagueState extends ClubState {
  final League league;
  final List<Club> clubs;

  ClubByLeagueState({this.clubs, this.league});

  ClubByLeagueState copyWith({
    List<Club> clubs,
    League league,
  }) {
    return ClubByLeagueState(
        clubs: clubs ?? this.clubs, league: league ?? this.league);
  }

  @override
  // TODO: implement props
  List<Object> get props => [clubs, league];
}
