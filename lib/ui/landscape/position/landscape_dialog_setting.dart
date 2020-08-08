import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class LandscapeDialogSetting extends StatefulWidget {
  @override
  _LandscapeDialogSettingState createState() => _LandscapeDialogSettingState();
}

class _LandscapeDialogSettingState extends State<LandscapeDialogSetting> {
  bool showCoach = false;
  bool showCaptain = false;
  bool isShowSubs = false;

  bool isOvrSelect = false;
  bool isPotentialSelect = false;
  bool isNumbSelect = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.transparent,
          child: _dialogContent(context),
        ),
      ],
    );
  }

  Widget _dialogContent(context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.74,
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _column1(),
                          _column2(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: _rowOvr(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          _okBtn(),
        ],
      ),
    );
  }

  Widget _column1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              showCoach = !showCoach;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: MyText(
                    text: 'Show coach',
                    color: Colors.black,
                    textAlign: TextAlign.start,
                    fontSize: 16,
                  ),
                ),
                Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool value) {
                    setState(() {
                      showCoach = !showCoach;
                    });
                  },
                  value: showCoach,
                  activeColor: Colors.deepOrangeAccent,
                ),
              ],
            ),
          ),
        ),
        _textField('Coach name'),
        Container(
          width: MediaQuery.of(context).size.width * 0.28,
          child: Divider(
            height: 0,
            thickness: 0.6,
          ),
        ),
        _textField('Team name'),
      ],
    );
  }

  Widget _column2() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                showCaptain = !showCaptain;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MyText(
                  text: 'Show captain',
                  color: Colors.black,
                  fontSize: 16,
                  textAlign: TextAlign.start,
                ),
                Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool value) {
                    setState(() {
                      showCaptain = !showCaptain;
                    });
                  },
                  value: showCaptain,
                  activeColor: Colors.deepOrangeAccent,
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                MyText(
                  text: 'Harry Maguire',
                  color: Colors.deepOrangeAccent,
                  fontSize: 16,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.deepOrangeAccent,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.28,
            child: Divider(
              height: 0,
              thickness: 0.6,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isShowSubs = !isShowSubs;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText(
                  text: 'Show subs\.',
                  color: Colors.black,
                  fontSize: 16,
                  isTitleCase: false,
                ),
                Switch(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (bool value) {
                    setState(() {
                      isShowSubs = !isShowSubs;
                    });
                  },
                  value: isShowSubs,
                  activeColor: Colors.deepOrangeAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowOvr() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isOvrSelect = !isOvrSelect;
                  isPotentialSelect = false;
                  isNumbSelect = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isOvrSelect ? Colors.deepOrangeAccent : Colors.black54,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  color: isOvrSelect ? Colors.deepOrangeAccent : Colors.white,
                ),
                child: MyText(
                  text: 'Overall',
                  color: isOvrSelect ? Colors.white : Colors.black45,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isPotentialSelect = !isPotentialSelect;
                  isOvrSelect = false;
                  isNumbSelect = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: isPotentialSelect
                            ? Colors.deepOrangeAccent
                            : Colors.black54),
                    bottom: BorderSide(
                        color: isPotentialSelect
                            ? Colors.deepOrangeAccent
                            : Colors.black54),
                  ),
                  color: isPotentialSelect
                      ? Colors.deepOrangeAccent
                      : Colors.white,
                ),
                child: MyText(
                  text: 'Potential',
                  color: isPotentialSelect ? Colors.white : Colors.black45,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isNumbSelect = !isNumbSelect;
                  isOvrSelect = false;
                  isPotentialSelect = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: isNumbSelect
                          ? Colors.deepOrangeAccent
                          : Colors.black54),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: isNumbSelect ? Colors.deepOrangeAccent : Colors.white,
                ),
                child: MyText(
                  text: 'Number',
                  color: isNumbSelect ? Colors.white : Colors.black45,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _okBtn() {
    return RaisedButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        Navigator.of(context).pop();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.74 - 7,
        padding: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              HexColor('FF6C01'),
              HexColor('FE9040'),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepOrangeAccent,
        ),
        alignment: Alignment.center,
        child: MyText(
          text: 'OK',
          isTitleCase: false,
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }

  Widget _textField(String hint) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorInputBackground,
      ),
      alignment: Alignment.center,
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          isDense: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.black38,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
