import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marozi/model/club/club.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/utils/firestore_service.dart';

class AddingClubImage extends StatefulWidget {
  final Club club;

  AddingClubImage(this.club);

  @override
  _AddingClubImageState createState() => _AddingClubImageState();
}

class _AddingClubImageState extends State<AddingClubImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: FutureBuilder(
        initialData: '',
        future:
            FireStorageService.loadFromStorage(context, widget.club.logoUrl),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return CachedNetworkImage(
            width: 45,
            height: 45,
            errorWidget: (context, string, dynamic) => Icon(
              Icons.error,
              size: 10,
              color: Colors.orange,
            ),
            placeholder: (context, string) {
              return BottomLoader();
            },
            imageUrl: snapshot.data,
          );
        },
      ),
    );
  }
}
