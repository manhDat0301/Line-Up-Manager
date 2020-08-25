import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/utils/firebase_to_local.dart';

part 'adding_event.dart';
part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(AddingState initialState) : super(initialState);

  @override
  Stream<AddingState> mapEventToState(AddingEvent event) async* {
    if (event is TableSelect) yield* _mapTableSelectToState(event);

    if (event is LeagueSelect) yield* _mapLeagueSelectToState(event);

    if (event is ClubSelect) yield* _mapClubSelectToState(event);

    if (event is ClearClubs) yield* _mapClearClubsToState(event);

    if (event is ClearPlayers) yield* _mapClearPlayersToState(event);

    if (event is MultiPlayerSelect) yield* _mapMultiPlayerSelectToState(event);
  }

  Stream<AddingState> _mapClubSelectToState(ClubSelect event) async* {
    var currentState = state;
    if (currentState is AddingSuccess) {
      final getPlayers = FirebaseToLocal();
      List<Player> players = await getPlayers.getPlayersByClub(event.club);
      yield currentState.copyWith(
        club: event.club,
        players: players,
      );
    }
  }

  Stream<AddingState> _mapClearClubsToState(ClearClubs event) async* {
    var currentState = state;
    if (currentState is AddingSuccess) {
      yield currentState.copyWith(clubs: []);
    }
  }

  Stream<AddingState> _mapClearPlayersToState(ClearPlayers event) async* {
    var currentState = state;
    if (currentState is AddingSuccess) {
      yield currentState.copyWith(players: []);
    }
  }

  Stream<AddingState> _mapMultiPlayerSelectToState(
      MultiPlayerSelect event) async* {
    var currentState = state;
    if (currentState is AddingSuccess) {
      if (currentState.isStarting) {
        List<Player> starting = List.from(currentState.starting);
        starting.any((player) => player.id == event.player.id)
            ? starting.removeWhere((player) => player.id == event.player.id)
            : starting.length < 11 ? starting.add(event.player) : print('');
        yield currentState.copyWith(starting: starting);
      } else {
        List<Player> subs = List.from(currentState.subs);
        subs.any((player) => player.id == event.player.id)
            ? subs.removeWhere((player) => player.id == event.player.id)
            : subs.length < 7 ? subs.add(event.player) : print('');
        yield currentState.copyWith(subs: subs);
      }
    }
  }

  Stream<AddingState> _mapLeagueSelectToState(LeagueSelect event) async* {
    var currentState = state;
    if (currentState is AddingSuccess) {
      final getClubs = FirebaseToLocal();
      List<Club> clubs = await getClubs.getClubsByLeague(event.league);
      yield currentState.copyWith(
        league: event.league,
        clubs: clubs,
      );
    }
  }

  Stream<AddingState> _mapTableSelectToState(TableSelect event) async* {
    var currentState = state;
    if (currentState is AddingInitial) {
      final getData = FirebaseToLocal();
      Map<String, List<League>> map = await getData.getLeagueByNation();
      yield AddingSuccess(
        leagueByNation: map,
        isStarting: event.isStarting,
        starting: event.starting,
        subs: event.subs,
        clubs: [],
        players: [],
      );
    }
    if (currentState is AddingSuccess) {
      if (event.isStarting) {
        List<Player> players = List<Player>.from(event.starting);
        yield currentState.copyWith(
          isStarting: event.isStarting,
          starting: players,
          league: League(),
          club: Club(),
          players: [],
          clubs: [],
        );
      } else {
        List<Player> subs = List<Player>.from(event.subs);
        yield currentState.copyWith(
          isStarting: event.isStarting,
          subs: subs,
          league: League(),
          club: Club(),
          players: [],
          clubs: [],
        );
      }
    }
  }
}
