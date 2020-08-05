import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/portrait/adding/favorite_bloc/favorite_bloc.dart';
import 'package:marozi/portrait/table/bloc/table_bloc.dart';
import 'package:marozi/resources/custom_lib/bottom_loader.dart';
import 'package:marozi/resources/custom_lib/my_text.dart';

class FavoritePlayers extends StatefulWidget {
  @override
  _FavoritePlayersState createState() => _FavoritePlayersState();
}

class _FavoritePlayersState extends State<FavoritePlayers> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteBloc>(
      create: (BuildContext context) =>
          FavoriteBloc(FavoriteInitial())..add(FavoriteFetch()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {},
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (BuildContext context, FavoriteState state) {
              if (state is FavoriteLoadSuccess) {
                return ExpansionTile(
                  title: MyText(
                    textAlign: TextAlign.start,
                    text: '${state.list.length} player(s)',
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  onExpansionChanged: (bool) {
                    if (bool) {
                      context.bloc<FavoriteBloc>().add(FavoriteFetch());
                    }
                  },
                  children: <Widget>[
                    Container(
                      height: state.list.length < 5 ? null : 150,
                      padding: const EdgeInsets.only(left: 25.0, bottom: 13),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context
                                  .bloc<TableBloc>()
                                  .add(PlayerSelect(state.list[index].favId));
                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/table', ModalRoute.withName('/homepage'));
                            },
                            child: Container(
                              height: 33,
                              alignment: Alignment.centerLeft,
                              child: MyText(
                                color: Colors.black,
                                fontSize: 17,
                                text: state.list[index].favName,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return BottomLoader();
            },
          ),
        ),
      ),
    );
  }
}
