part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMarked extends FavoriteState {
  final bool isFav;

  FavoriteMarked({this.isFav});

  @override
  // TODO: implement props
  List<Object> get props => [isFav];
}
