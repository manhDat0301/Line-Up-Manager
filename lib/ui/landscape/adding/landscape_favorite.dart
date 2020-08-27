import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/adding/favorite_bloc/favorite_bloc.dart';

class LandscapeFavorite extends StatefulWidget {
  @override
  _LandscapeFavoriteState createState() => _LandscapeFavoriteState();
}

class _LandscapeFavoriteState extends State<LandscapeFavorite> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (BuildContext context, FavoriteState state) {
        if (state is FavoriteLoadSuccess) {
          return Container(
            child: ExpansionTile(
              title: Text('Favorite'),
            ),
          );
        }
        return Container();
      },

    );
  }
}
