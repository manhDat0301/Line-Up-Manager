import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/favorite/favorite.dart';
import 'package:marozi/model/favorite/favorite_repository.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/model/player/player_repository.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/ui/portrait/position/repository/portrait_offset.dart';

part 'position_event.dart';

part 'position_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  PositionBloc(PositionState initialState) : super(initialState);

  @override
  Stream<PositionState> mapEventToState(PositionEvent event) async* {
    if (event is CreateFormation) yield* _mapCreateFormationToState(event);

    if (event is PositionTestEvent) yield* _mapTestEventToState();

    if (event is FormationChange) yield* _mapFormationChangeToState(event);

    if (event is PositionSwap) yield* _mapPositionSwapToState(event);

    if (event is DropPlayer) yield* _mapDropPlayerToState(event);
  }

  Stream<PositionState> _mapTestEventToState() async* {
    yield PositionSuccess(
      players: await _getListFav(),
      offsets: OffsetPortrait.form_4_2_3_1(Constants.width, Constants.height),
      formations: Constants.formations,
      currentPage: 0,
    );
  }

  Stream<PositionState> _mapCreateFormationToState(event) async* {
    yield PositionSuccess(
      formations: Constants.formations,
      currentPage: 0,
      players: event.list,
      offsets: OffsetPortrait.form_4_2_3_1(Constants.width, Constants.height),
    );
  }

  Stream<PositionState> _mapPositionSwapToState(event) async* {
    var currentState = state;
    if (currentState is PositionSuccess) {
      List<Offset> offsets = List.from(currentState.offsets);
      Offset temp = offsets[event.first];
      offsets[event.first] = offsets[event.second];
      offsets[event.second] = temp;
      yield currentState.copyWith(offsets: offsets);
    }
  }

  Stream<PositionState> _mapDropPlayerToState(event) async* {
    var currentState = state;
    if (currentState is PositionSuccess) {
      List<Offset> offsets = List.from(currentState.offsets);
      offsets[event.index] = event.offset - Offset(4, 51.5);
      yield currentState.copyWith(offsets: offsets);
    }
  }

  Stream<PositionState> _mapFormationChangeToState(event) async* {
    var currentState = state;
    double width = Constants.width;
    double height = Constants.height;
    if (currentState is PositionSuccess) {
      switch (event.i) {
        case 0:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_2_3_1(width, height),
          );
          break;
        case 1:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_3_3(width, height),
          );
          break;
        case 2:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 3:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 4:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 5:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 6:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 7:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 8:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 9:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 10:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        case 11:
          yield currentState.copyWith(
            currentPage: event.i,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
        default:
          yield currentState.copyWith(
            currentPage: 0,
            offsets: OffsetPortrait.form_4_4_2(width, height),
          );
          break;
      }
    }
  }

  Future<List<Player>> _getListFav() async {
    final favRepo = FavoriteRepository();
    final playerRepo = PlayerRepository();
    List<Favorite> listFav = await favRepo.getAllFavorite();
    List<Player> players = [];
    for (var fav in listFav) {
      Player player = await playerRepo.getPlayer(playerId: fav.favId);
      players.add(player);
    }
    return players;
  }
}
