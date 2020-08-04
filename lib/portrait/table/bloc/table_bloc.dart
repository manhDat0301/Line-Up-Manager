import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/portrait/adding/repository/adding_constants.dart';

part 'table_event.dart';

part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc(TableState initialState) : super(initialState);

  @override
  Stream<TableState> mapEventToState(TableEvent event) async* {
    final currentState = state;
    if (event is AddButtonPress) {
      yield* _mapAddButtonToState(event);
    }
    if (event is PlayerSelect) {
      AddingConstants.tableMap[AddingConstants.key] = event.player;
      yield PlayerAdded(
          map: (Map.from(AddingConstants.tableMap))
            ..update(AddingConstants.key, (value) => event.player));
    }
    if (event is PlayerDelete) {
      if (currentState is PlayerAdded) {
        yield PlayerAdded(map: Map.from(currentState.map)..remove(event.key));
      }
    }
  }

  Stream<TableState> _mapAddButtonToState(event) async* {
    print('_mapAddButtonToState : ${AddingConstants.tableMap}');
    AddingConstants.key = event.key;
  }

  Stream<TableState> _mapPlayerSelectToState(event) async* {
    AddingConstants.tableMap[AddingConstants.key] = event.player;
    print('_mapPlayerSelectToState : ${AddingConstants.tableMap}');
    yield PlayerAdded(map: AddingConstants.tableMap);
  }

  Stream<TableState> _mapPlayerDeleteToState(event, currentState) async* {
    AddingConstants.tableMap.remove(event.key);
    print('_mapPlayerDeleteToState : ${AddingConstants.tableMap}');
    if (currentState is PlayerAdded)
      yield PlayerAdded(map: AddingConstants.tableMap);
  }
}
