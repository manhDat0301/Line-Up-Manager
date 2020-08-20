import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/utils/firebase_to_local.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(PlayerState initialState) : super(initialState);

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    var currentState = state;
    if (currentState is PlayerInitial) {
      if (event is GetPlayerByClub) {
        final getData = FirebaseToLocal();
        yield PlayersSuccess(
          players: await getData.getPlayersByClub(event.club),
          club: event.club,
          selectedStarting: [],
          selectedSubs: [],
        );
      }
    }
    if (currentState is PlayersSuccess) {
      if (event is GetPlayerByClub) {
        yield PlayerInitial();
        final getData = FirebaseToLocal();
        yield currentState.copyWith(
          players: await getData.getPlayersByClub(event.club),
          club: event.club,
        );
      }
      if (event is MultiSelectPlayer) {
        // starting XI
        if (Constants.key < 11) {
          List<String> starting = List.from(currentState.selectedStarting);
          (starting.isEmpty || !starting.contains(event.playerId)) &&
                  currentState.selectedStarting.length < Constants.key
              ? starting.add(event.playerId)
              : starting.remove(event.playerId);
          yield currentState.copyWith(
            selectedStarting: starting,
          );
        }
        // subs
        else if (Constants.key > 11 && Constants.key < 18) {
          List<String> subs = List.from(currentState.selectedSubs);
          (subs.isEmpty || !subs.contains(event.playerId)) &&
                  currentState.selectedSubs.length < Constants.key
              ? subs.add(event.playerId)
              : subs.remove(event.playerId);
          yield currentState.copyWith(
            selectedSubs: subs,
          );
        }
      }
    }
  }
}
