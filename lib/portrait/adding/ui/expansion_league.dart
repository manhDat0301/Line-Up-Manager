import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/portrait/adding/club_bloc/club_bloc.dart';
import 'package:marozi/portrait/adding/ui/expansion_club.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';
import 'package:marozi/resources/custom_lib/my_text.dart';
import 'package:marozi/utils/firestore_service.dart';

class ExpansionLeague extends StatefulWidget {
  final List<League> leagues;
  final int listIndex;
  final String nation;

  ExpansionLeague({this.leagues, this.listIndex, this.nation, key})
      : super(key: key);

  @override
  _ExpansionLeagueState createState() => _ExpansionLeagueState();
}

class _ExpansionLeagueState extends State<ExpansionLeague> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  int selected = -1;
  String nation = '';

  @override
  void initState() {
    super.initState();
    _scrollController..addListener(() => _scrollListener);
  }

  void _scrollListener() {}

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.leagues.length,
          itemBuilder: (context, index) {
            return _leagueWidget(index, widget.leagues[index]);
          },
        ),
      ),
    );
  }

  Widget _leagueWidget(int index, League league) {
    return BlocProvider<ClubBloc>(
      create: (BuildContext context) => ClubBloc(ClubInitial()),
      child: BlocBuilder<ClubBloc, ClubState>(
        builder: (BuildContext context, ClubState state) {
          return ExpansionTile(
            key: Key('${index}'),
            title: MyText(
              text: league.name,
              color: null,
              fontSize: 19,
              textAlign: TextAlign.start,
            ),
            onExpansionChanged: (bool) {
              if (bool) {
                context.bloc<ClubBloc>().add(GetClubByLeague(league));
              } else {}
            },
            initiallyExpanded:
                selected == index && nation == widget.nation ? true : false,
            leading: FutureBuilder(
              initialData: '',
              future:
                  FireStorageService.loadFromStorage(context, league.logoUrl),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Container(
                  width: 45,
                  height: 45,
                  child: CachedNetworkImage(
                    errorWidget: (context, string, dynamic) {
                      return Container(
                        child: Icon(Icons.error),
                      );
                    },
                    imageUrl: snapshot.data,
                    placeholder: (context, string) {
                      return BottomLoader();
                    },
                  ),
                );
              },
            ),
            children: <Widget>[
              state is ClubByLeagueState
                  ? SingleChildScrollView(
                      child: Container(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.clubs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ExpansionClub(club: state.clubs[index]);
                          },
                        ),
                      ),
                    )
                  : BottomLoader(),
            ],
          );
        },
      ),
    );
  }
}
