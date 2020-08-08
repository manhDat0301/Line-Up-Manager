import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marozi/model/league/league.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/utils/firestore_service.dart';

class AddingLeagueImage extends StatefulWidget {
  final League league;

  AddingLeagueImage(this.league);

  @override
  _AddingLeagueImageState createState() => _AddingLeagueImageState();
}

class _AddingLeagueImageState extends State<AddingLeagueImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: '',
      future:
      FireStorageService.loadFromStorage(context, widget.league.logoUrl),
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
    );
  }
}
