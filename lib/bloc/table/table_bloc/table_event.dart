part of 'table_bloc.dart';

class TableEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddButtonPress extends TableEvent {
  final int index;

  AddButtonPress(this.index);

  @override
  // TODO: implement props
  List<Object> get props => [index];
}

class PlayerSelect extends TableEvent {
  final List<String> playersId;

  PlayerSelect(this.playersId);

  @override
  // TODO: implement props
  List<Object> get props => [playersId];
}

class PlayerDelete extends TableEvent {
  final int key;

  PlayerDelete(this.key);

  @override
  // TODO: implement props
  List<Object> get props => [key];
}
