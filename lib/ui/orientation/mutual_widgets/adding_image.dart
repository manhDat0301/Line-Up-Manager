import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
import 'package:marozi/utils/firestore_service.dart';

class AddingImage extends StatefulWidget {
  final String url;
  final bool isPlayer;

  AddingImage(this.url, {this.isPlayer = false});

  @override
  _AddingImageState createState() => _AddingImageState();
}

class _AddingImageState extends State<AddingImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStorageService.loadFromStorage(context, widget.url),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Container(
          width: 55,
          height: 55,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.isPlayer ? 10000.0 : 0),
            child: CachedNetworkImage(
              alignment: Alignment.center,
              errorWidget: (context, string, dynamic) => Icon(
                Icons.error,
                color: Colors.orange,
              ),
              placeholder: (context, string) {
                return BottomLoader();
              },
              imageUrl: snapshot.data ?? '',
            ),
          ),
        );
      },
    );
  }
}
