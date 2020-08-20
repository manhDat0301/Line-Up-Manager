import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/utils/firebase_to_local.dart';

part 'adding_event.dart';

part 'adding_state.dart';

class AddingBloc extends Bloc<AddingEvent, AddingState> {
  AddingBloc(AddingState initialState) : super(initialState);

  @override
  Stream<AddingState> mapEventToState(AddingEvent event) async* {
    if (event is GetLeagueByNation) {
      var currentState = state;
      if (currentState is AddingInitial) {
        yield* _mapGetLeagueByNationToInitial();
      }
      if (currentState is LeagueByNationSuccess) {
        if (event is LeagueSelect) {
          yield currentState.copyWith(index: (event as LeagueSelect).index);
        }
      }
    }
  }

  Stream<AddingState> _mapGetLeagueByNationToInitial() async* {
    final getData = FirebaseToLocal();
    yield LeagueByNationSuccess(
      leagueByNation: await getData.getLeagueByNation(),
      hasReachedMax: false,
    );
  }

  bool _hasReachedMax(AddingState state) =>
      state is LeagueByNationSuccess && state.hasReachedMax;
}
