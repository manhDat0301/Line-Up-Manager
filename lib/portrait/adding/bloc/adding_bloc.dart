import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/league/league.dart';

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(AddingState initialState) : super(initialState);

  @override
  Stream<AddingState> mapEventToState(AddingEvent event) async* {}
}
