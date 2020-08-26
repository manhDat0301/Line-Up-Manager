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
    if (event is GetLeagueByNation) yield* _mapGetLeagueByNationToState(event);

    if (event is LeagueSelect) yield* _mapLeagueSelectToState(event);

    if (event is ClubSelect) yield* _mapClubSelectToState(event);

    if (event is ClubBack) yield* _mapClubBackToState(event);

    if (event is LeagueBack) yield* _mapLeagueBackToState(event);

    if (event is MultiPlayerSel) yield* _mapMultiPlayerSelectToState(event);

    if (event is TableSelect) yield* _mapTableSelectToState(event);
  }

  Stream<AddingState> _mapGetLeagueByNationToState(
      GetLeagueByNation event) async* {
    final getData = FirebaseToLocal();
    Map<String, List<League>> map = await getData.getLeagueByNation();
    yield AddingLeagueSelecting(
      leagueByNation: map,
    );
  }

  Stream<AddingState> _mapLeagueSelectToState(LeagueSelect event) async* {
    final getData = FirebaseToLocal();
    List<Club> clubs = await getData.getClubsByLeague(event.league);
    var currentState = state;
    if (currentState is AddingLeagueSelecting) {
      yield AddingClubsSelecting(
        league: event.league,
        clubs: clubs,
        leagueByNation: currentState.leagueByNation,
      );
    }
  }

  Stream<AddingState> _mapClubSelectToState(ClubSelect event) async* {
    final getPlayers = FirebaseToLocal();
    List<Player> players = await getPlayers.getPlayersByClub(event.club);
    var currentState = state;
    if (currentState is AddingClubsSelecting) {
      yield AddingPlayersSelecting(
        club: event.club,
        players: players,
        clubs: currentState.clubs,
        league: currentState.league,
        leagueByNation: currentState.leagueByNation,
      );
    }
  }

  Stream<AddingState> _mapClubBackToState(ClubBack event) async* {
    var currentState = state;
    if (currentState is AddingPlayersSelecting) {
      yield AddingClubsSelecting(
          league: currentState.league,
          clubs: currentState.clubs,
          leagueByNation: currentState.leagueByNation);
    }
  }

  Stream<AddingState> _mapLeagueBackToState(LeagueBack event) async* {
    var currentState = state;
    if (currentState is AddingClubsSelecting) {
      yield AddingLeagueSelecting(
        leagueByNation: currentState.leagueByNation,
      );
    }
  }

  Stream<AddingState> _mapMultiPlayerSelectToState(
      MultiPlayerSel event) async* {
    var currentState = state;
    if (currentState is AddingLeagueSelecting) {
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

  Stream<AddingState> _mapTableSelectToState(TableSelect event) async* {
    var currentState = state;
    if (currentState is AddingInitial) {
      final getData = FirebaseToLocal();
      Map<String, List<League>> map = await getData.getLeagueByNation();
      yield AddingLeagueSelecting(
        leagueByNation: map,
        isStarting: event.isStarting,
        starting: event.starting,
        subs: event.subs,
      );
    }
    if (currentState is AddingLeagueSelecting) {
      if (event.isStarting) {
        List<Player> players = List<Player>.from(event.starting);
        yield currentState.copyWith(
          isStarting: event.isStarting,
          starting: players,
          club: Club(),
          players: [],
        );
      } else {
        List<Player> subs = List<Player>.from(event.subs);
        yield currentState.copyWith(
          isStarting: event.isStarting,
          subs: subs,
          club: Club(),
          players: [],
        );
      }
    }
  }
}
