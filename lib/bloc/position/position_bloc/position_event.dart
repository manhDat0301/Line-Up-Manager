part of 'position_bloc.dart';

class PositionEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PositionTestEvent extends PositionEvent {}

class CreateFormation extends PositionEvent {
  final List<Player> list;

  CreateFormation(this.list);

  @override
  // TODO: implement props
  List<Object> get props => [list];
}

class FormationChange extends PositionEvent {
  final int i;

  FormationChange(this.i);

  @override
  // TODO: implement props
  List<Object> get props => [i];
}

class PositionSwap extends PositionEvent {
  final int first;
  final int second;

  PositionSwap(this.first, this.second);

  @override
  // TODO: implement props
  List<Object> get props => [first, second];
}

class DropPlayer extends PositionEvent {
  final Offset offset;
  final int index;

  DropPlayer(this.offset, this.index);

  @override
  // TODO: implement props
  List<Object> get props => [offset, index];
}
