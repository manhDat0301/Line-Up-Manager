import 'package:flutter/material.dart';
import 'package:marozi/resources/custom_icons/custom_icon_icons.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class ExportButton extends StatefulWidget {
  @override
  _ExportButtonState createState() => _ExportButtonState();
}

class _ExportButtonState extends State<ExportButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8),
              ),
            ),
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => _export());
      },
      child: Icon(CustomIcon.export_icon, color: Colors.orange),
    );
  }

  Widget _export() {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _typeExport(),
          _cancel(),
        ],
      ),
    );
  }

  Widget _typeExport() {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: isLandscape ? width * 0.5 : width,
        height: isLandscape ? height * 0.57 : height * 0.38,
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  print('Save to camera roll');
                },
                child: _type(icon: Icons.image, text: 'Save to camera roll'),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  print('Facebook');
                },
                child: _type(icon: CustomIcon.facebook, text: 'Facebook'),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  print('Instagram');
                },
                child: _type(icon: CustomIcon.instagram, text: 'Instagram'),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  print('Twitter');
                },
                child: _type(icon: CustomIcon.twitter, text: 'Twitter'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cancel() {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: isLandscape ? width * 0.5 : width,
      height: 57,
      padding: EdgeInsets.only(top: 10),
      child: InkWell(
        child: RaisedButton(
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: MyText(
            text: 'Cancel',
            color: Colors.orange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _type({IconData icon, String text}) {
    return Row(
      children: <Widget>[
        Icon(icon, color: Colors.orange),
        SizedBox(width: 15),
        MyText(
          text: text,
          color: Colors.black,
          fontSize: 17,
          isTitleCase: false,
        ),
      ],
    );
  }
}
