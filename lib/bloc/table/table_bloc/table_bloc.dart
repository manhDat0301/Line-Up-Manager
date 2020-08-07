import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/model/player/player_repository.dart';
import 'package:marozi/repository/constants.dart';

part 'table_event.dart';

part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc(TableState initialState) : super(initialState);

  @override
  Stream<TableState> mapEventToState(TableEvent event) async* {
    if (event is AddButtonPress) {
      yield* _mapAddButtonToState(event);
  }

    if (event is PlayerSelect) {
      yield* _mapPlayerSelectToState(event);
    }

    if (event is PlayerDelete) {
      yield* _mapPlayerDeleteToState(event);
    }
  }

  Stream<TableState> _mapAddButtonToState(event) async* {
    Constants.key = event.key;
  }

  Stream<TableState> _mapPlayerSelectToState(event) async* {
    var currentState = state;
    final playerRepo = PlayerRepository();
    final player = await playerRepo.getPlayer(playerId: event.playerId);
    if (currentState is PlayerAdded) {
      currentState.map[Constants.key] = Player();
      yield PlayerAdded(
          map: (Map.from(currentState.map))
            ..update(Constants.key, (value) => player));
    } else {
      Map<int, Player> map = {};
      map[Constants.key] = player;
      yield PlayerAdded(map: map);
    }
  }

  Stream<TableState> _mapPlayerDeleteToState(event) async* {
    var currentState = state;
    if (currentState is PlayerAdded)
      yield PlayerAdded(map: Map.from(currentState.map)..remove(event.key));
  }
}
