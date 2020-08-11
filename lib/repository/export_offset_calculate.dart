class ExportOffsetCalculate {
  static final double _halfW = 22.5;
  static final double _halfH = 22.5; //text:12

  static double _dxPortrait(double width, double per) {
    return width * per / 100 - _halfW;
  }

  static double _dyPortrait(double height, double per) {
    return height * per / 100;
  }
}