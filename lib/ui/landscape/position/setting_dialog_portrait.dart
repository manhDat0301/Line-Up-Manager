import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';

class DialogSettingPortrait extends StatelessWidget {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: dialogContent(context),
    );
  }

  dialogContent(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 15, 5, 0),
          child: Column(
            children: <Widget>[
              _textField('Team name'),
              _showSubCoach(),
              _textField('Coach name'),
              _showCap(),
              _bottom(),
              _buttonOk(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _textField(String text) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorInputBackground,
      ),
      margin: EdgeInsets.all(8),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: text,
          contentPadding: EdgeInsets.all(0.0),
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 17,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        style: TextStyle(),
        maxLines: 1,
      ),
    );
  }

  Widget _showSubCoach() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText(
                text: 'Show substitutes',
                color: Colors.black,
                fontSize: 17,
              ),
              Switch(
                activeColor: Colors.orange,
                value: substitutesShow,
                onChanged: (bool value) {
                  setState(() {
                    substitutesShow = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MyText(
                text: 'Show coach',
                color: Colors.black,
                fontSize: 17,
              ),
              Switch(
                activeColor: Colors.orange,
                value: coachShow,
                onChanged: (bool value) {
                  setState(() {
                    coachShow = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showCap() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Column(
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
                value: captainShow,
                onChanged: (value) {
                  setState(() {
                    captainShow = value;
                  });
                },
                activeColor: Colors.orange,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MyText(
                  text: 'Harry Maguire',
                  color: Colors.orange,
                  fontSize: 17,
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
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
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
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
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
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
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: MyText(text: 'OK', color: Colors.white, fontSize: 19),
      ),
    );
  }
}
