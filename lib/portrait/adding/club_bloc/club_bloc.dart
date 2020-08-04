import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/utils/firebase_or_local.dart';

part 'club_event.dart';

part 'club_state.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  ClubBloc(ClubState initialState) : super(initialState);

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    if (event is GetClubByLeague) {
      final getData = FirebaseOrLocal();
      yield ClubByLeagueState(
          clubs: await getData.getClubsByLeague(event.league));
    }
  }
}
