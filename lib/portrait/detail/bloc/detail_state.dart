part of 'detail_bloc.dart';

class DetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailInitial extends DetailState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailedLoadSuccess extends DetailState {
  final Player player;
  final String clubImageUrl;

  DetailedLoadSuccess({this.player, this.clubImageUrl});

  @override
  // TODO: implement props
  List<Object> get props => [player, clubImageUrl];
}
