import 'dart:ui';

import 'package:marozi/repository/calculate_offset.dart';
import 'package:marozi/ui/portrait/position/repository/portrait_percentage.dart';

class OffsetPortrait {
  static List<Offset> _formation;

  static List<Offset> form_4_2_3_1(double width, double height) {
    _formation = CalculateOffset.getListOffset(
      width: width,
      height: height,
      percent: PercentagePortrait.percent_4_2_3_1,
    );
    return _formation;
  }

  static List<Offset> form_4_3_3(double width, double height) {
    _formation = CalculateOffset.getListOffset(
      width: width,
      height: height,
      percent: PercentagePortrait.percent_4_3_3,
    );
    return _formation;
  }

  static List<Offset> form_4_4_2(double width, double height) {
    _formation = CalculateOffset.getListOffset(
      width: width,
      height: height,
      percent: PercentagePortrait.percent_4_4_2,
    );
    return _formation;
  }
}
