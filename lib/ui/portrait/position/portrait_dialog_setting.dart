import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class PortraitDialogSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCustomDialog();
  }
}

class MyCustomDialog extends StatefulWidget {
  @override
  _MyCustomDialogState createState() => _MyCustomDialogState();
}

class _MyCustomDialogState extends State<MyCustomDialog> {
  bool substitutesShow = true;
  bool coachShow = true;
  bool captainShow = false;

  bool ratingSelected = false;
  bool formSelected = false;
  bool numberSelected = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: dialogContent(context),
    );
  }

  dialogContent(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: _textField('Team name'),
                      ),
                      _showSubCoach(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _textField('Coach name'),
                      ),
                      Divider(height: 0),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18, top: 10),
                        child: _showCap(),
                      ),
                      Divider(height: 0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: _bottom(),
                ),
              ],
            ),
          ),
          _buttonOk(),
        ],
      ),
    );
  }

  Widget _textField(String hint) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.7,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorInputBackground,
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hint,
          isDense: true,
          contentPadding: EdgeInsets.all(0.0),
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 16,
          color: Colors.black38,
          fontStyle: FontStyle.italic,
        ),
        maxLines: 1,
      ),
    );
  }

  Widget _showSubCoach() {
    return Column(
      children: <Widget>[
        Divider(height: 0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText(
                text: 'Show substitutes',
                color: Colors.black,
                fontSize: 17,
              ),
              Switch(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: Colors.deepOrangeAccent,
                value: substitutesShow,
                onChanged: (bool value) {
                  setState(() {
                    substitutesShow = value;
                  });
                },
              ),
            ],
          ),
        ),
        Divider(height: 0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText(
                text: 'Show coach',
                color: Colors.black,
                fontSize: 17,
              ),
              Switch(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                activeColor: Colors.deepOrangeAccent,
                value: coachShow,
                onChanged: (bool value) {
                  setState(() {
                    coachShow = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _showCap() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MyText(
              text: 'Show captain',
              fontSize: 17,
              color: Colors.black,
            ),
            Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: captainShow,
              onChanged: (value) {
                setState(() {
                  captainShow = value;
                });
              },
              activeColor: Colors.deepOrangeAccent,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText(
                text: 'Harry Maguire',
                color: Colors.deepOrangeAccent,
                fontSize: 17,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottom() {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  ratingSelected = !ratingSelected;
                  formSelected = false;
                  numberSelected = false;
                });
              },
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ratingSelected ? Colors.orange : Colors.white,
                  border: Border.all(
                      color: ratingSelected ? Colors.orange : Colors.black38),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: MyText(
                  text: 'Rating',
                  color: ratingSelected ? Colors.white : Colors.black38,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  formSelected = !formSelected;
                  numberSelected = false;
                  ratingSelected = false;
                });
              },
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: formSelected ? Colors.orange : Colors.white,
                  border: Border(
                    top: BorderSide(
                        color: formSelected ? Colors.orange : Colors.black38),
                    bottom: BorderSide(
                        color: formSelected ? Colors.orange : Colors.black38),
                  ),
                ),
                child: MyText(
                  text: 'Form',
                  color: formSelected ? Colors.white : Colors.black38,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  numberSelected = !numberSelected;
                  formSelected = false;
                  ratingSelected = false;
                });
              },
              child: Container(
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: numberSelected ? Colors.orange : Colors.white,
                  border: Border.all(
                      color: numberSelected ? Colors.orange : Colors.black38),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: MyText(
                  text: 'Number',
                  color: numberSelected ? Colors.white : Colors.black38,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonOk() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8 - 7,
      child: RaisedButton(
        elevation: 12,
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: MyText(
          text: 'OK',
          color: Colors.white,
          fontSize: 19,
          isTitleCase: false,
        ),
      ),
    );
  }
}
