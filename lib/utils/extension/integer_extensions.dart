import 'package:sherif_raafat/constants/constant_values.dart';

/// Integer value extensions
extension IntegerExtensions on int {
  /// Returns `true` if the color is considered dark, and `false` if it is
  /// considered light.
  ///
  /// The luminance of the color is computed as the sum of its red, green,
  /// and blue components,
  /// divided by three. If the resulting value is less than or equal to 128,
  /// the color is considered dark; otherwise, it is considered light.
  bool get computeLuminance {
    return this <= luminanceLimit;
  }
}
