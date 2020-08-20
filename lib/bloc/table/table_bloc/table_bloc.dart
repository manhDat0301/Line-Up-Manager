import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/model/player/player_repository.dart';

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

  Stream<TableState> _mapAddButtonToState(AddButtonPress event) async* {
    var starting = List<Player>(11);
    var l = List.from(starting);
    print(l.length);
    print(l[0]);
  }

  Stream<TableState> _mapPlayerSelectToState(PlayerSelect event) async* {
    var currentState = state;
    final playerRepo = PlayerRepository();
    if (currentState is TableAddedSuccess) {
      var starting = List<Player>(11);
      yield TableAddedSuccess(
        players: starting,
      );
    } else {}
  }

  Stream<TableState> _mapPlayerDeleteToState(event) async* {
    var currentState = state;
    if (currentState is TableAddedSuccess) {}
  }
}
