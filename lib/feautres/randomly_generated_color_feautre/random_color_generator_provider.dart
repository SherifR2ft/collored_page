import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sherif_raafat/constants/app_colors.dart';
import 'package:sherif_raafat/constants/constant_values.dart';
import 'package:sherif_raafat/utils/extension/integer_extensions.dart';

/// Random Color Generator Provider [ChangeNotifier]
class RandomColorGeneratorProvider extends ChangeNotifier {
  Orientation? _orientation;
  Color _backGroundColor = AppColors.primaryBackGroundColor;
  Color _textColor = AppColors.primaryText;
  Color _secondTextColor = AppColors.primaryText.withOpacity(0.5);

  /// [backGroundColor] get background color
  Color get backGroundColor => _backGroundColor;

  /// [textColor] get text color for gradiant
  Color get textColor => _textColor;

  /// [secondTextColor] get text color for gradiant
  Color get secondTextColor => _secondTextColor;

  /// change colors when screen rotate
  void setOrientation(Orientation orientation) {
    if (_orientation == null) {
      _orientation = orientation;
    } else if (_orientation != orientation) {
      _orientation = orientation;
      generateRandomlyColor();
    }
  }

  /// randomly generated color [_backGroundColor] and
  /// [_textColor] and [_secondTextColor] to be matched.
  void generateRandomlyColor() {
    // Generate a random hue value between 0 and 360 degrees
    final hue = Random().nextInt(360);
    // Generate a random brightness value between 0.2 and 0.8
    final brightness = 0.2 + (Random().nextDouble() * 0.6);
    // Create the text color with a contrasting hue value, the same brightness
    final textColorHue = (hue + 180) % 360;

    _backGroundColor = HSLColor.fromAHSL(
      1,
      textColorHue.toDouble(),
      saturationValue,
      brightness,
    ).toColor();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: _backGroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: _secondTextColor,
      ),
    );
    const double _firstColorVariance = 10;
    _textColor = HSLColor.fromAHSL(
      1,
      textColorHue.computeLuminance
          ? textColorHue.toDouble() + _firstColorVariance
          : textColorHue.toDouble() - _firstColorVariance,
      saturationValue,
      brightness,
    ).toColor();
    const double _secondColorVariance = 75;
    _secondTextColor = HSLColor.fromAHSL(
      1,
      textColorHue.computeLuminance
          ? textColorHue.toDouble() + _secondColorVariance
          : textColorHue.toDouble() - _secondColorVariance,
      saturationValue,
      brightness,
    ).toColor();
    notifyListeners();
  }
}
