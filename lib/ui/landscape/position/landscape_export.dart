import 'package:flutter/material.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/resources/custom_widgets/export_button.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/dialog_setting.dart';

class LandscapeExport extends StatefulWidget {
  @override
  _LandscapeExportState createState() => _LandscapeExportState();
}

class _LandscapeExportState extends State<LandscapeExport> {
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
          MyText(
            text: 'Export',
            color: Colors.black,
            fontSize: 19,
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
                    Expanded(child: Container(color: Colors.white)),
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
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: '\\15',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => DialogSetting());
                            },
                            child: Icon(
                              Icons.settings,
                              color: Colors.black54,
                            ),
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
                width: 130,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
                child: ListView.builder(
                  itemCount: Constants.listExport.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Text(
                          Constants.listExport[index],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
