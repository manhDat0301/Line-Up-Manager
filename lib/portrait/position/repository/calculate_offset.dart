import 'dart:ui';

import 'package:flutter/cupertino.dart';

class CalculateOffset {
//  static final List<double> percentWidth4CB = [12, 37, 61, 86];
//  static final List<double> percentWidth2CDM = [36, 62];
//  static final List<double> percentWidth3CAM = [20, 50, 78];
//  static final List<double> percentWidth1ST = [50];
//  static final List<double> percentWidthGK = [50];

//  static final List<double> percentHeight4CB = [48, 52, 52, 48];
//  static final List<double> percentHeight2CDM = [35, 35];
//  static final List<double> percentHeight3CAM = [18, 18, 18];
//  static final List<double> percentHeight1ST = [3];
//  static final List<double> percentHeightGK = [67];

  static double _halfPlayerHeight = 75 / 2;
  static double _halfPlayerWidth = 83 / 2;

  static double _dxPortrait(double width, double per) {
    return width * per / 100 - _halfPlayerWidth;
  }

  static double _dyPortrait(double height, double per) {
    return height * per / 100;
  }

  static List<Offset> getListOffset({
    @required double width,
    @required double height,
    @required List<Offset> percent,
  }) {
    List<Offset> offsets = [];
    for (int i = 0; i < 11; i++) {
      double dx = _dxPortrait(width, percent[i].dx);
      double dy = _dyPortrait(height, percent[i].dy);
      offsets.add(Offset(dx, dy));
    }
    return offsets;
  }
}
