import 'package:flutter/material.dart';
import 'package:marozi/resources/fonts.dart';

class MyText extends StatelessWidget {
  final String text;

  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  MyText({
    @required this.text,
    @required this.fontSize,
    @required this.color,
    this.fontWeight,
    this.fontStyle,
    this.textAlign,
  });

  final FontWeight fontWeight;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign != null ? textAlign : TextAlign.center,
      style: TextStyle(
        fontFamily: fontSFDisplayRegular,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight != null ? fontWeight : FontWeight.normal,
        fontStyle: fontStyle != null ? fontStyle : FontStyle.normal,
      ),
    );
  }
}
