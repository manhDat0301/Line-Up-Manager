import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club_repository.dart';
import 'package:marozi/model/player/player.dart';
import 'package:marozi/model/player/player_repository.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(DetailState initialState) : super(initialState);

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is DetailFetch) {
      final playerRepo = PlayerRepository();
      final clubRepo = ClubRepository();
      final player = await playerRepo.getPlayer(playerId: event.playerId);
      String clubUrl = await clubRepo.getAColOfClub(clubId: player.clubId, columns: ['logo_url']);
      print(clubUrl);
      yield DetailedLoadSuccess(player: player, clubImageUrl: clubUrl);
    }
  }
}
