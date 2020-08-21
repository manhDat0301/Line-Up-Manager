import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/utils/firebase_to_local.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(PlayerState initialState) : super(initialState);

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is GetPlayerByClub) {
      yield* _mapGetPlayerByClubToS(event);
    }

    if (event is MultiSelectPlayer) {
      yield* _mapMultiSelectPlayerToS(event);
    }

    if (event is AddButtonPress) {
      yield* _mapAddButtonPressedToS(event);
    }
  }

  Stream<PlayerState> _mapGetPlayerByClubToS(GetPlayerByClub event) async* {
    var currentState = state;
    if (currentState is PlayersSuccess) {
      yield PlayerInitial();
      final getData = FirebaseToLocal();
      yield currentState.copyWith(
        players: await getData.getPlayersByClub(event.club),
        club: event.club,
      );
    }
  }

  Stream<PlayerState> _mapMultiSelectPlayerToS(MultiSelectPlayer event) async* {
    var currentState = state;
    if (currentState is PlayersSuccess) {
      // starting XI
      if (currentState.isStartingSelect) {

        List<Player> starting = List.from(currentState.selectedStarting);

        !starting.any((Player player) => player.id == event.player.id) &&
                starting.length < 11
            ? starting.add(event.player)
            : starting.removeWhere((player) => player.id == event.player.id);

        yield currentState.copyWith(
          selectedStarting: starting,
        );
      }
      // subs
      else {
        List<Player> subs = List.from(currentState.selectedSubs);

        (!subs.any((Player player) => player.id == event.player.id)) &&
                subs.length < 7
            ? subs.add(event.player)
            : subs.removeWhere((player) => player.id == event.player.id);

        yield currentState.copyWith(
          selectedSubs: subs,
        );
      }
    }
  }

  Stream<PlayerState> _mapAddButtonPressedToS(AddButtonPress event) async* {
    var currentState = state;
    if (currentState is PlayersSuccess) {
      yield currentState.copyWith(
        selectedStarting: event.isStartingSelect
            ? event.playersSelected
            : currentState.selectedStarting,
        selectedSubs: event.isStartingSelect
            ? event.playersSelected
            : currentState.selectedSubs,
        isStartingSelect: event.isStartingSelect,
      );
    } else {
      yield PlayersSuccess(
        selectedSubs: [],
        selectedStarting: [],
        isStartingSelect: event.isStartingSelect,
      );
    }
  }
}
