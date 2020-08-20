part of 'player_bloc.dart';

class PlayerState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PlayerInitial extends PlayerState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class PlayersSuccess extends PlayerState {
  final List<Player> players;
  final Club club;
  final List<String> selectedStarting;
  final List<String> selectedSubs;

  PlayersSuccess({
    this.players,
    this.club,
    this.selectedStarting,
    this.selectedSubs,
  });

  PlayersSuccess copyWith({
    List<Player> players,
    Club club,
    List<String> selectedStarting,
    List<String> selectedSubs,
  }) {
    return PlayersSuccess(
      players: players ?? this.players,
      club: club ?? this.club,
      selectedStarting: selectedStarting ?? this.selectedStarting,
      selectedSubs: selectedSubs ?? this.selectedSubs,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        players,
        club,
        selectedStarting,
        selectedSubs,
      ];
}
