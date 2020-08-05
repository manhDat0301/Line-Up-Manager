import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/favorite/favorite_repository.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(FavoriteState initialState) : super(initialState);

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is InitFavorite) {
      yield* _mapInitFavToState(event);
    }

    if (event is UpdateFavorite) {
      yield* _mapUpdateFavToState(event);
    }
  }

  Stream<FavoriteState> _mapInitFavToState(event) async* {
    final favRepo = FavoriteRepository();
    yield FavoriteMarked(
        isFav: await favRepo.isFavorite(playerId: event.playerId));
  }

  Stream<FavoriteState> _mapUpdateFavToState(event) async* {
    final favRepo = FavoriteRepository();
    var currentState = state;
    if (currentState is FavoriteMarked) {
      if (currentState.isFav) {
        int i = await favRepo.deleteFavorite(playerId: event.playerId);
        print('i: $i currentState.isFav: ${currentState.isFav}');
        yield FavoriteMarked(isFav: !currentState.isFav);
      } else {
        int i = await favRepo.insertFavorite(playerId: event.playerId);
        print('i: $i currentState.isFav: ${currentState.isFav}');
        yield FavoriteMarked(isFav: !currentState.isFav);
      }
    }
  }
}
