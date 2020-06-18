import 'package:flutter/material.dart';
import 'package:marozi/data/data.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/portrait/export_button.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:provider/provider.dart';

class ExportLandscape extends StatefulWidget {
  @override
  _ExportLandscapeState createState() => _ExportLandscapeState();
}

class _ExportLandscapeState extends State<ExportLandscape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              _topBar(),
              _center(),
            ],
          ),
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
          ExportButton(),
        ],
      ),
    );
  }

  Widget _center() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container(color: Colors.red)),
                    Divider(indent: 15, endIndent: 15, height: 14),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                text: '1.19',
                                color: Colors.orange,
                                fontSize: 19,
                              ),
                              MyText(
                                text: '\$',
                                color: Colors.orange,
                                fontSize: 13,
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              text: '1',
                              style: TextStyle(
                                color: Colors.orange,
                                fontFamily: fontSFDisplayRegular,
                              ),
                              children: [
                                TextSpan(
                                  text: '\\15',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: fontSFDisplayRegular,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.settings,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                width: 140,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
                child: ListView(
                  children: <Widget>[
                    ...Iterable<int>.generate(
                            Provider.of<Data>(context).listTypeFormation.length)
                        .map((i) => InkWell(
                              onTap: () {},
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 40,
                                    child: MyText(
                                      text: Provider.of<Data>(context)
                                          .listTypeFormation[i],
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
//                                  i <
//                                          Provider.of<Data>(context)
//                                                  .listTypeFormation
//                                                  .length -
//                                              1
//                                      ? Divider(
//                                          thickness: 1, color: Colors.black)
//                                      : Container(),
                                  Divider(),
                                ],
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
