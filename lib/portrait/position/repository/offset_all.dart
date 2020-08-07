import 'dart:ui';

import 'package:marozi/portrait/position/repository/calculate_offset.dart';
import 'package:marozi/portrait/position/repository/percentage.dart';

class OffsetAll {
  static List<Offset> _formation;

  static List<Offset> form_4_2_3_1(double width, double height) {
    _formation = CalculateOffset.getListOffset(
      width: width,
      height: height,
      percent: Percentage.percent_4_2_3_1,
    );
    return _formation;
  }

  static List<Offset> form_4_3_3(double width, double height) {
    _formation = CalculateOffset.getListOffset(
      width: width,
      height: height,
      percent: Percentage.percent_4_3_3,
    );
    return _formation;
  }

  static List<Offset> form_4_4_2(double width, double height) {
    _formation = CalculateOffset.getListOffset(
      width: width,
      height: height,
      percent: Percentage.percent_4_4_2,
    );
    return _formation;
  }
}
