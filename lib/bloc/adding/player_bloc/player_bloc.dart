import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(PlayerState initialState) : super(initialState);

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is TableUpdate) {
      yield* _mapTableUpdateToState(event);
    }
    if (event is MultiPlayerSelect) {
      yield* _mapMultiPlayerSelectToState(event);
    }
  }

  Stream<PlayerState> _mapTableUpdateToState(TableUpdate event) async* {
    yield PlayersSelected(
      isStarting: event.isStarting,
      starting: event.starting,
      subs: event.subs,
    );
  }

  Stream<PlayerState> _mapMultiPlayerSelectToState(
      MultiPlayerSelect event) async* {
    var currentState = state;
    if (currentState is PlayersSelected) {
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
}
