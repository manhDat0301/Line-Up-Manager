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
    if (event is GetLeagueByNation && !_hasReachedMax(state)) {
      try {
        var currentState = state;
        if (currentState is AddingInitial) {
          yield* _mapGetLeagueByNationToInitial();
        }
        if (currentState is LeagueByNationSuccess) {
          yield* _getMore(currentState);
        }
      } catch (e) {
        yield LeagueByNationFailed();
      }
    }
  }

  Stream<AddingState> _mapGetLeagueByNationToInitial() async* {
    final getData = FirebaseToLocal();
    AddingConstants.leagueByNation = await getData.getLeagueByNation();
    yield LeagueByNationSuccess(
      leagueByNation: await _load(0, 5),
      hasReachedMax: false,
    );
  }

  Stream<AddingState> _getMore(LeagueByNationSuccess currentState) async* {
    print(
        'currentState.leagueByNation.length: ${currentState.leagueByNation.length}');
    bool hasReachedMax = currentState.hasReachedMax;
    if (currentState.leagueByNation.length ==
        AddingConstants.leagueByNation.length) {
      hasReachedMax = true;
    }
    await Future.delayed(Duration(milliseconds: 500));
    yield currentState.copyWith(
      leagueByNation: Map.from(currentState.leagueByNation)
        ..addAll(await _load(currentState.leagueByNation.length, 5)),
      hasReachedMax: hasReachedMax,
    );
  }

  Future<Map<String, List<League>>> _load(int startIndex, int max) async {
    Map<String, List<League>> map = {};
    try {
      for (int i = startIndex; i < max + startIndex; i++) {
        String key = AddingConstants.leagueByNation.keys.toList()[i];
        map[key] = AddingConstants.leagueByNation[key];
      }
    } catch (e) {
      print('exception: $e');
    }

    return map;
  }

  bool _hasReachedMax(AddingState state) =>
      state is LeagueByNationSuccess && state.hasReachedMax;
}
