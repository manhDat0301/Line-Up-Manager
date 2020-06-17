import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:marozi/custom_icons/custom_icon_icons.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/resources/colors.dart';

class ExportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.only(left: 7, right: 7, top: 7),
              decoration: BoxDecoration(
                color: colorPlayerBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              print('camera roll');
                            },
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.image, color: Colors.orange),
                                SizedBox(width: 15),
                                MyText(
                                  text: 'Save to camera rolls',
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("facebook");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(CustomIcon.facebook,
                                      color: Colors.orange),
                                  SizedBox(width: 15),
                                  MyText(
                                    text: 'Facebook',
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("instagram");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(CustomIcon.instagram,
                                      color: Colors.orange),
                                  SizedBox(width: 15),
                                  MyText(
                                    text: 'Instagram',
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("twitter");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Icon(CustomIcon.twitter,
                                      color: Colors.orange),
                                  SizedBox(width: 15),
                                  MyText(
                                    text: 'Twitter',
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 57,
                    padding: EdgeInsets.only(top: 10),
                    child: InkWell(
                      child: RaisedButton(
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
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(CustomIcon.export_icon, color: Colors.orange),
      ),
    );
  }
}
