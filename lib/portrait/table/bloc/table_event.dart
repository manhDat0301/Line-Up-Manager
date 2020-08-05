part of 'table_bloc.dart';

class TableEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddButtonPress extends TableEvent {
  final int key;

  AddButtonPress(this.key);

  @override
  // TODO: implement props
  List<Object> get props => [key];
}

class PlayerSelect extends TableEvent {
  final String playerId;

  PlayerSelect(this.playerId);

  @override
  // TODO: implement props
  List<Object> get props => [playerId];
}

class PlayerDelete extends TableEvent {
  final int key;

  PlayerDelete(this.key);

  @override
  // TODO: implement props
  List<Object> get props => [key];
}
