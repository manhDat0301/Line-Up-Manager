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
  final List<Club> clubs;

  ClubByLeagueState({this.clubs});

  ClubByLeagueState copyWith({List<Club> clubs}) {
    return ClubByLeagueState(clubs: clubs ?? this.clubs);
  }

  @override
  // TODO: implement props
  List<Object> get props => [clubs];
}
