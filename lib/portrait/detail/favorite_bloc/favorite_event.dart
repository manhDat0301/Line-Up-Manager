part of 'favorite_bloc.dart';

class FavoriteEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitFavorite extends FavoriteEvent {
  final String playerId;

  InitFavorite(this.playerId);

  @override
// TODO: implement props
  List<Object> get props => [playerId];
}

class UpdateFavorite extends FavoriteEvent {
  final String playerId;

  UpdateFavorite(this.playerId);

  @override
  // TODO: implement props
  List<Object> get props => [playerId];
}
