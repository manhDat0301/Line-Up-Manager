import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marozi/bloc/export/export_bloc.dart';
import 'package:marozi/repository/constants.dart';
import 'package:marozi/resources/custom_widgets/export_button.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/ui/orientation/dialog_setting.dart';
import 'package:marozi/ui/portrait/export/portrait_export_page.dart';

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
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: MyText(
                  text: 'Style',
                  color: Colors.black,
                  fontSize: 17,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
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
      child: Card(
        child: Column(
          children: <Widget>[
            PortraitExportPage(),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 3, 11, 3),
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
                          fontSize: 17,
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
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 17,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\\15',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 17,
                          ),
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
      height: MediaQuery.of(context).size.height * 0.07,
      child: Card(
        child: BlocBuilder<ExportBloc, ExportState>(
          builder: (BuildContext context, ExportState state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.listExport.length,
              itemBuilder: (context, index) {
                if (state is ExportFromPositionSuccess) {
                  return Row(
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.all(0),
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
                      index != 0 && index < state.exportTypes.length - 1
                          ? VerticalDivider(
                              color: Colors.black,
                              thickness: 0.15,
                              indent: 12,
                              width: 1,
                              endIndent: 12,
                            )
                          : SizedBox(),
                    ],
                  );
                }
                return Container();
              },
            );
          },
        ),
      ),
    );
  }
}
