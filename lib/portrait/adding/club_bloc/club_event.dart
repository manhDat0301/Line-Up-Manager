part of 'club_bloc.dart';

class ClubEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetClubByLeague extends ClubEvent {
  final League league;

  GetClubByLeague(this.league);

  @override
  // TODO: implement props
  List<Object> get props => [league];
}
