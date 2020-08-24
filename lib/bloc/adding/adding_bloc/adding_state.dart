part of 'adding_bloc.dart';

class AddingState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddingInitial extends AddingState {}

class AddingSuccess extends AddingState {
  final Map<String, List<League>> leagueByNation;

  // Table to Adding
  final bool isStarting;
  final List<Player> starting;
  final List<Player> subs;

  // Club by League
  final League league;
  final List<Club> clubs;

  // Player by Club
  final Club club;
  final List<Player> players;

  AddingSuccess({
    this.leagueByNation,
    this.isStarting,
    this.starting,
    this.subs,
    this.league,
    this.clubs,
    this.club,
    this.players,
  });

  AddingSuccess copyWith({
    Map<String, List<League>> leagueByNation,
    bool isStarting,
    List<Player> subs,
    List<Player> starting,
    League league,
    List<Club> clubs,
    Club club,
    List<Player> players,
  }) {
    return AddingSuccess(
      leagueByNation: leagueByNation ?? this.leagueByNation,
      isStarting: isStarting ?? this.isStarting,
      starting: starting ?? this.starting,
      subs: subs ?? this.subs,
      players: players ?? this.players,
      club: club ?? this.club,
      league: league ?? this.league,
      clubs: clubs ?? this.clubs,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        this.leagueByNation,
        isStarting,
        starting,
        subs,
        league,
        clubs,
        club,
        players,
      ];
}

class LeagueByNationFailed extends AddingState {}
