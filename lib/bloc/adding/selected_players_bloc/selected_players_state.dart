part of 'selected_players_bloc.dart';

class PlayerState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {}

class PlayersSelected extends PlayerState {
  final bool isStarting;
  final List<Player> starting;
  final List<Player> subs;

  PlayersSelected({this.isStarting, this.starting, this.subs});

  PlayersSelected copyWith({
    bool isStarting,
    List<Player> starting,
    List<Player> subs,
  }) {
    return PlayersSelected(
        subs: subs ?? this.subs,
        isStarting: isStarting ?? this.isStarting,
        starting: starting ?? this.starting);
  }

  @override
  // TODO: implement props
  List<Object> get props => [isStarting, starting, subs];
}
