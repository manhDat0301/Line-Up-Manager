import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/club/club_repository.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/model/player/player_repository.dart';
import 'package:marozi/utils/firebase_to_local.dart';

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(AddingState initialState) : super(initialState);

  @override
  Stream<AddingState> mapEventToState(AddingEvent event) async* {
    var currentState = state;

    if (event is TableSelect) {
      yield* _mapTableSelectToInitial(event);
      if (currentState is AddingSuccess) {
        if (event.isStarting) {
          yield currentState.copyWith(
            isStarting: event.isStarting,
            starting: event.starting,
          );
        } else {
          yield currentState.copyWith(
            isStarting: event.isStarting,
            subs: event.starting,
          );
        }
      }
    }

    if (currentState is AddingSuccess) {
      if (event is LeagueSelect) {
        final clubRepo = ClubRepository();
        yield currentState.copyWith(
          league: event.league,
          clubs: await clubRepo.getClubsByLeague(league: event.league),
        );
      }
      if (event is ClubSelect) {
        final playerRepo = PlayerRepository();
        yield currentState.copyWith(
          club: event.club,
          players: await playerRepo.getPlayersByClub(
            club: event.club,
          ),
        );
      }
      if (event is ClearClubs) {
        yield currentState.copyWith(clubs: []);
      }
      if (event is ClearPlayers) {
        yield currentState.copyWith(players: []);
      }

      if (event is MultiPlayerSelect) {
        if (currentState.isStarting) {
          List<Player> starting = List.from(currentState.starting);
          starting.any((player) => player.id == event.player.id)
              ? starting.removeWhere((player) => player.id == event.player.id)
              : starting.length < 11 ? starting.add(event.player) : print('');
          yield currentState.copyWith(starting: starting);
        } else {
          List<Player> subs = List.from(currentState.starting);
          subs.any((player) => player.id == event.player.id)
              ? subs.removeWhere((player) => player.id == event.player.id)
              : subs.length < 7 ? subs.add(event.player) : print('');
          yield currentState.copyWith(subs: subs);
        }
      }
    }

    if (event is UpdateTable) {
      if (currentState is AddingSuccess) {
        yield currentState.copyWith(starting: event.starting, subs: event.subs);
      }
    }
  }

  Stream<AddingState> _mapTableSelectToInitial(TableSelect event) async* {
    final getData = FirebaseToLocal();
    yield AddingSuccess(
      leagueByNation: await getData.getLeagueByNation(),
      isStarting: event.isStarting,
      starting: event.starting,
      subs: event.subs,
      clubs: [],
      players: [],
    );
  }
}
