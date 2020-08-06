part of 'position_bloc.dart';

class PositionEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PositionTestEvent extends PositionEvent {}

class FormationChange extends PositionEvent {
  final int i;

  FormationChange(this.i);

  @override
  // TODO: implement props
  List<Object> get props => [i];
}

class CreateFormation extends PositionEvent {
  final List<Player> list;

  CreateFormation(this.list);

  @override
  // TODO: implement props
  List<Object> get props => [list];
}
