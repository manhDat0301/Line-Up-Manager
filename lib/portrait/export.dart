import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marozi/custom_icon_export.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/portrait/custom_dialog.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

class Export extends StatefulWidget {
  @override
  _ExportState createState() => _ExportState();
}

class _ExportState extends State<Export> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          children: <Widget>[
            _topBar(),
            _center(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
              child: Text(
                'Style',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: fontSFDisplayRegular,
                ),
              ),
            ),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios, color: Colors.orange),
          ),
          Text(
            'Export',
            style: TextStyle(
              fontFamily: fontSFDisplayRegular,
              fontSize: 19,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(CustomIcon.export_icon, color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _center() {
    return Expanded(
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 6, 13, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '1.99',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontFamily: fontSFDisplayRegular),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          '\$',
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                              fontFamily: fontSFDisplayRegular),
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: '1',
                      style: TextStyle(
                          color: Colors.orange,
                          fontFamily: fontSFDisplayRegular,
                          fontSize: 17),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\\15',
                          style: TextStyle(
                              color: Colors.black38,
                              fontFamily: fontSFDisplayRegular,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => CustomDialog());
                    },
                    child: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottom() {
    return Container(
      height: 60,
      child: Card(
        child: ListView(
          children: <Widget>[
            ...Iterable<int>.generate(
                    Provider.of<Data>(context).listStyle.length)
                .map((int index) => Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            Provider.of<Data>(context).listStyle[index],
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: fontSFDisplayRegular,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        index < Provider.of<Data>(context).listStyle.length - 1
                            ? VerticalDivider(
                                color: Colors.black,
                                thickness: 0.15,
                                indent: 12,
                                endIndent: 12,
                              )
                            : SizedBox(),
                      ],
                    )),
          ],
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
