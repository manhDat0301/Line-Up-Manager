
import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class LandscapeDialogSetting extends StatefulWidget {
  @override
  _LandscapeDialogSettingState createState() => _LandscapeDialogSettingState();
}

class _LandscapeDialogSettingState extends State<LandscapeDialogSetting> {
  bool isShowCoach = false;
  bool isShowCaptain = false;
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
          backgroundColor: Colors.white,
          child: _dialogContent(context),
        ),
      ],
    );
  }

  Widget _dialogContent(context) {
    return Container(
      width: 330,
      margin: const EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Column(
        children: <Widget>[
          _row1(),
          SizedBox(height: 8),
          _row2(),
          SizedBox(height: 8),
          _row3(),
          SizedBox(height: 8),
          _rowOvr(),
          SizedBox(height: 15),
          _okBtn(),
        ],
      ),
    );
  }

  Widget _rowOvr() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              isOvrSelect = !isOvrSelect;
              isPotentialSelect = false;
              isNumbSelect = false;
            });
          },
          child: Container(
            width: 110,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isOvrSelect ? Colors.orange : Colors.black54),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: isOvrSelect ? Colors.orange : Colors.white,
            ),
            child: MyText(
              text: 'Overall',
              color: isOvrSelect ? Colors.white : Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isPotentialSelect = !isPotentialSelect;
              isOvrSelect = false;
              isNumbSelect = false;
            });
          },
          child: Container(
            width: 110,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: isPotentialSelect ? Colors.orange : Colors.black54),
                bottom: BorderSide(
                    color: isPotentialSelect ? Colors.orange : Colors.black54),
              ),
              color: isPotentialSelect ? Colors.orange : Colors.white,
            ),
            child: MyText(
              text: 'Potential',
              color: isPotentialSelect ? Colors.white : Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isNumbSelect = !isNumbSelect;
              isOvrSelect = false;
              isPotentialSelect = false;
            });
          },
          child: Container(
            width: 110,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                  color: isNumbSelect ? Colors.orange : Colors.black54),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: isNumbSelect ? Colors.orange : Colors.white,
            ),
            child: MyText(
              text: 'Number',
              color: isNumbSelect ? Colors.white : Colors.black45,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _row1() {
    return Container(
      width: 330,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _container(
            InkWell(
              onTap: () {
                setState(() {
                  isShowCoach = !isShowCoach;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'Show coach',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  Switch(
                    onChanged: (bool value) {
                      setState(() {
                        isShowCoach = !isShowCoach;
                      });
                    },
                    value: isShowCoach,
                    activeColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          _container(
            InkWell(
              onTap: () {
                setState(() {
                  isShowCaptain = !isShowCaptain;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'Show captain',
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  Switch(
                    onChanged: (bool value) {
                      setState(() {
                        isShowCaptain = !isShowCaptain;
                      });
                    },
                    value: isShowCaptain,
                    activeColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _container(_textField('Coach name')),
        _container(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              MyText(
                text: 'Harry Maguire',
                color: Colors.orange,
                fontSize: 16,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _container(_textField('Team name')),
        _container(
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
                  text: 'Show subs.',
                  color: Colors.black,
                  fontSize: 16,
                ),
                Switch(
                  onChanged: (bool value) {
                    setState(() {
                      isShowSubs = !isShowSubs;
                    });
                  },
                  value: isShowSubs,
                  activeColor: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _container(Widget child) {
    return Container(
      width: 140,
      alignment: Alignment.centerLeft,
      child: child,
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
        padding: EdgeInsets.all(0.0),
        width: 330,
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
          color: Colors.orange,
        ),
        alignment: Alignment.center,
        child: MyText(
          text: 'OK',
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }

  Widget _switch(String text, bool show) {
    return InkWell(
      onTap: () {
        setState(() {
          show = !show;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MyText(
            text: text,
            color: Colors.black,
            fontSize: 16,
          ),
          Switch(
            onChanged: (bool value) {
              setState(() {
                show = !show;
              });
            },
            value: show,
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _textField(String hint) {
    return Container(
      width: 140,
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
