import 'package:flutter/material.dart';

/// different app sizes
class AppSize {
  /// set Default Size
  static void setDefaultSize(BuildContext context) {
    _widthSize = MediaQuery.of(context).size.width;
    _heightSize = MediaQuery.of(context).size.height;
    _primarySize =
        _widthSize * 0.04 - MediaQuery.textScaleFactorOf(context) + 6.5;
    if (_primarySize > 25) _primarySize = 25;
  }

  /// screen height
  static double _heightSize = 10; //MediaQuery.of(context).size.height

  /// screen width
  static double _widthSize = 10; //MediaQuery.of(context).size.width

  ///  TEXT :-
  ///
  ///for search field [primarySize] ==>> 22
  static double _primarySize = 10;

  /// for big title [bigSize] ==>> 15
  static double _bigSize = _primarySize - 7;

  /// for normal fields [mediumSize] ==>> 14
  static double _mediumSize = _primarySize - 8;

  /// for title of normal fields [smallSize] ==>> 12
  static double _smallSize = _primarySize - 10;

  ///get App size
  static double get heightSize => _heightSize;

  ///
  static double get widthSize => _widthSize;

  ///
  static double get primarySize => _primarySize; //22
  ///
  static double get bigSize => _bigSize; // 15
  ///
  static double get mediumSize => _mediumSize; //14
  ///
  static double get smallSize => _smallSize; //12
}
