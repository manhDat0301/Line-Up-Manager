import 'package:flutter/material.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/resources/custom_widgets/export_button.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/dialog_setting.dart';

class PortraitExport extends StatefulWidget {
  @override
  _PortraitExportState createState() => _PortraitExportState();
}

class _PortraitExportState extends State<PortraitExport> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: <Widget>[
              _topBar(),
              _center(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 2.0),
                child: MyText(
                  text: 'Style',
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              _bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
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
    );
  }

  Widget _center() {
    return Expanded(
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.white,
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
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          '\$',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      text: '1',
                      style: TextStyle(color: Colors.orange, fontSize: 17),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\\15',
                          style: TextStyle(color: Colors.black38, fontSize: 17),
                        ),
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
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Constants.listExport.length,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    Constants.listExport[index],
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                ),
                index < Constants.listExport.length - 1
                    ? VerticalDivider(
                        color: Colors.black,
                        thickness: 0.15,
                        indent: 12,
                        endIndent: 12,
                      )
                    : SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
