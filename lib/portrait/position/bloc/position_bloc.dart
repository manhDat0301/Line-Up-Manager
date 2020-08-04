import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'position_event.dart';

part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  PositionBloc(PositionState initialState) : super(initialState);

  @override
  Stream<PositionState> mapEventToState(PositionEvent event) async* {}
}
