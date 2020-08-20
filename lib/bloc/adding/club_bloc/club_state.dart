part of 'club_bloc.dart';

class ClubState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ClubInitial extends ClubState {}

class ClubByLeagueSuccess extends ClubState {
  final League league;
  final List<Club> clubs;

  ClubByLeagueSuccess({this.clubs, this.league});

  ClubByLeagueSuccess copyWith({
    List<Club> clubs,
    League league,
  }) {
    return ClubByLeagueSuccess(
        clubs: clubs ?? this.clubs, league: league ?? this.league);
  }

  @override
  // TODO: implement props
  List<Object> get props => [clubs, league];
}
