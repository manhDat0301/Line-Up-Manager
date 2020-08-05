import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/portrait/adding/repository/adding_constants.dart';
import 'package:marozi/utils/firebase_to_local.dart';

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(AddingState initialState) : super(initialState);

  @override
  Stream<AddingState> mapEventToState(AddingEvent event) async* {
    if (event is GetLeagueByNation) {
      final getData = FirebaseOrLocal();
      yield LeagueByNationInitial(
          leagueByNation: await getData.getLeagueByNation());
    }
  }
}
