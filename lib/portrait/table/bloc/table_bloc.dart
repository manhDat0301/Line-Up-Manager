import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/adding/repository/adding_constants.dart';

part 'table_event.dart';

part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableBloc(TableState initialState) : super(initialState);

  @override
  Stream<TableState> mapEventToState(TableEvent event) async* {
    if (event is AddButtonPress) {
      AddingConstants.key = event.key;
    }
  }
}
