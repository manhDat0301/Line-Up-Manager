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
      yield* _mapGetPlayerByClubToState(event);
    }


    if (event is SelectedList) {
      yield* _mapSelectedListToState(event);
    }
  }

  Stream<PlayerState> _mapGetPlayerByClubToState(GetPlayerByClub event) async* {
    var currentState = state;
    if (currentState is PlayersSuccess) {
      yield PlayerInitial();
      final getData = FirebaseToLocal();
      yield currentState.copyWith(
        players: await getData.getPlayersByClub(event.club),
        club: event.club,
      );
    } else {
      final getData = FirebaseToLocal();
      yield PlayersSuccess(
        players: await getData.getPlayersByClub(event.club),
        club: event.club,
      );
    }
  }


  Stream<PlayerState> _mapSelectedListToState(SelectedList event) async* {
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
