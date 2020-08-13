import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/resources/custom_widgets/bottom_loader.dart';
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
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
        height: double.infinity,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.82,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
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
                                fontSize: 16,
                                isTitleCase: false,
                              ),
                              MyText(
                                isTitleCase: false,
                                text: '\$',
                                color: Colors.orange,
                                fontSize: 12,
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
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _bottom() {
    return Expanded(
      child: Card(
        child: BlocBuilder<ExportBloc, ExportState>(
          builder: (BuildContext context, ExportState state) {
            if (state is ExportFromPositionSuccess) {
              return ListView.builder(
                itemCount: state.exportTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        onPressed: () {
                          context.bloc<ExportBloc>().add(SelectType(index));
                        },
                        child: Text(
                          state.exportTypes[index],
                          style: TextStyle(
                            fontSize: 17,
                            color: state.currentPage == index
                                ? Colors.deepOrangeAccent
                                : Colors.black,
                          ),
                        ),
                      ),
                      index < state.exportTypes.length - 1
                          ? Container(
                              width: double.infinity,
                              child: Divider(
                                color: Colors.black,
                                thickness: 0.15,
                                height: 0,
                                indent: 12,
                                endIndent: 12,
                              ),
                            )
                          : SizedBox(),
                    ],
                  );
                },
              );
            }
            return BottomLoader();
          },
        ),
      ),
    );
  }
}
