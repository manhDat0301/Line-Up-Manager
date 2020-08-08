import 'package:flutter/material.dart';
import 'package:marozi/resources/colors.dart';
import 'package:marozi/resources/custom_widgets/my_text.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:marozi/resources/strings.dart';

class PortraitHomePage extends StatefulWidget {
  @override
  _PortraitHomePageState createState() => _PortraitHomePageState();
}

class _PortraitHomePageState extends State<PortraitHomePage> {
  PageController _pageController = PageController(
    viewportFraction: 0.7,
    initialPage: 0,
  );

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: MyText(
                    text: 'Select mode',
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Spacer(),
            _pageView(),
            _goButton(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _pageView() {
    return Container(
      height: 470,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _portrait(),
          _landscape(),
        ],
      ),
    );
  }

  Widget _portrait() {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(table);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image.asset('assets/images/portrait.png'),
            ),
          ),
          Expanded(
            child: Center(
              child: MyText(
                text: 'Portrait Mode',
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _landscape() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.asset('assets/images/landscape.png')),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Center(
                    child: MyText(
                      text: 'Landscape Mode',
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _goButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: () {
          Navigator.pushNamed(context, table);
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.69,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                HexColor('FF7008'),
                HexColor('FF964A'),
              ],
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Go',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontFamily: fontSFDisplayRegular),
          ),
        ),
      ),
    );
  }
}
