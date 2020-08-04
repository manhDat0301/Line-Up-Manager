part of 'table_bloc.dart';

class TableEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AddButtonPress extends TableEvent {
  int key;

  AddButtonPress(this.key);

  @override
  // TODO: implement props
  List<Object> get props => [key];
}

class PlayerSelect extends TableEvent {
  Player player;

  PlayerSelect(this.player);

  @override
  // TODO: implement props
  List<Object> get props => [player];
}

class PlayerDelete extends TableEvent {
  int key;

  PlayerDelete(this.key);

  @override
  // TODO: implement props
  List<Object> get props => [key];
}
