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
  final List<Player> selectedStarting;
  final List<Player> selectedSubs;
  final bool isStartingSelect;

  PlayersSuccess({
    this.players,
    this.club,
    this.selectedStarting,
    this.selectedSubs,
    this.isStartingSelect,
  });

  PlayersSuccess copyWith({
    List<Player> players,
    Club club,
    List<Player> selectedStarting,
    List<Player> selectedSubs,
    bool isStartingSelect,
  }) {
    return PlayersSuccess(
      players: players ?? this.players,
      club: club ?? this.club,
      selectedStarting: selectedStarting ?? this.selectedStarting,
      selectedSubs: selectedSubs ?? this.selectedSubs,
      isStartingSelect: isStartingSelect ?? this.isStartingSelect,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        players,
        club,
        selectedStarting,
        selectedSubs,
        isStartingSelect,
      ];
}
