import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/favorite_bloc/favorite_bloc.dart';
import 'package:marozi/bloc/table/table_bloc/table_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/strings.dart';
import 'package:marozi/utils/firestore_service.dart';

class FavoritePlayers extends StatefulWidget {
  @override
  _FavoritePlayersState createState() => _FavoritePlayersState();
}

class _FavoritePlayersState extends State<FavoritePlayers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (BuildContext context, FavoriteState state) {
        if (state is FavoriteLoadSuccess) {
          if (state.list.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                  child: MyText(
                    textAlign: TextAlign.start,
                    text: 'Favorite players',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ExpansionTile(
                    title: MyText(
                      textAlign: TextAlign.start,
                      text: '${state.list.length} player(s)',
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    onExpansionChanged: (bool) {
                      if (bool) {
//                    context.bloc<FavoriteBloc>().add(FavoriteFetch());
                      }
                    },
                    children: <Widget>[
                      Container(
                        height: state.list.length < 5 ? null : 230,
                        padding: const EdgeInsets.only(left: 15.5, bottom: 13),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    table, ModalRoute.withName(homepage));
                                context
                                    .bloc<TableBloc>()
                                    .add(PlayerSelect(state.list[index].favId));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Row(
                                  children: [
                                    FutureBuilder(
                                      future:
                                          FireStorageService.loadFromStorage(
                                              context,
                                              state.list[index].favAvtUrl),
                                      initialData: '',
                                      builder: (BuildContext context,
                                          AsyncSnapshot<dynamic> snapshot) {
                                        return Container(
                                          width: 50,
                                          height: 50,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10000.0),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  BottomLoader(),
                                              errorWidget:
                                                  (context, string, dynamic) {
                                                return Icon(
                                                  Icons.error,
                                                  color: Colors.orange,
                                                );
                                              },
                                              imageUrl: snapshot.data,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: MyText(
                                          textAlign: TextAlign.start,
                                          color: Colors.black,
                                          fontSize: 17,
                                          text: state.list[index].favName,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        } else {
          return Container(height: 60, child: BottomLoader());
        }
      },
    );
  }
}
