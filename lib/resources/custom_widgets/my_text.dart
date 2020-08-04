import 'package:flutter/material.dart';
import 'package:marozi/resources/fonts.dart';
import 'package:recase/recase.dart';


class MyText extends StatelessWidget {
  final String text;

  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final bool isTitleCase;

  MyText({
    @required this.text,
    @required this.fontSize,
    @required this.color,
    this.fontWeight,
    this.isTitleCase = true,
    this.fontStyle,
    this.textAlign,
  });

  final FontWeight fontWeight;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      isTitleCase ? text.titleCase : null,
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
