import 'package:flutter/material.dart';
import 'package:marozi/data/my_text.dart';
import 'package:marozi/landscape/landscape.dart';

class ModeLandscape extends StatefulWidget {
  @override
  _ModeLandscapeState createState() => _ModeLandscapeState();
}

class _ModeLandscapeState extends State<ModeLandscape> {
  PageController _pageController = PageController(
    viewportFraction: 0.75,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: true,
        right: true,
        child: Center(
          child: Column(
            children: <Widget>[
              MyText(
                text: 'Select mode',
                color: Colors.black,
                fontSize: 19,
              ),
              _center(),
              _goBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _center() {
    return Expanded(
      child: Container(
        height: 247,
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          pageSnapping: true,
          onPageChanged: (bool) {
//            SystemChrome.setPreferredOrientations([
//              DeviceOrientation.portraitUp,
//              DeviceOrientation.portraitDown,
//            ]);
          },
          children: <Widget>[
            Card(child: _landscapeMode()),
            Card(child: _portraitMode()),
          ],
        ),
      ),
    );
  }

  Widget _landscapeMode() {
    return Row(
      children: <Widget>[
        Image.asset('assets/images/landscape.png'),
        Flexible(
          fit: FlexFit.tight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: MyText(
                  text: 'Landscape',
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              Flexible(
                child: MyText(
                  text: 'Mode',
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _portraitMode() {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 130,
            alignment: Alignment.center,
            child: Image.asset('assets/images/portrait.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Divider(
                color: Colors.black,
                indent: 10,
                thickness: 0.1,
                height: 0,
              ),
              MyText(
                text: 'Portrait Mode',
                color: Colors.black,
                fontSize: 19,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _goBtn() {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: RaisedButton(
        color: Colors.orange,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => Landscape()));
        },
        child: MyText(
          text: 'Go',
          color: Colors.white,
          textAlign: TextAlign.center,
          fontSize: 19,
        ),
      ),
    );
  }
}
