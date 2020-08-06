import 'dart:ui';

class Offset433 {
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

  static double halfPlayerHeight = 75 / 2;
  static double halfPlayerWidth = 83 / 2;

  static final List<double> _dxPercent = [
    13,
    50,
    87,
    25,
    50,
    75,
    12,
    37,
    61,
    86,
    50,
  ];

  static final List<double> _dyPercent = [
    6,
    1,
    6,
    23,
    27,
    23,
    45,
    48,
    48,
    45,
    64,
  ];

  static double _dxPortrait(double width, double per) {
    return width * per / 100 - halfPlayerWidth;
  }

  static double _dyPortrait(double height, double per) {
    return height * per / 100;
  }

  static List<Offset> getListOffset(double width, double height) {
    List<Offset> offsets = [];
    for (int i = 0; i < 11; i++) {
      double dx = _dxPortrait(width, _dxPercent[i]);
      double dy = _dyPortrait(height, _dyPercent[i]);
      offsets.add(Offset(dx, dy));
    }
    return offsets;
  }
}
