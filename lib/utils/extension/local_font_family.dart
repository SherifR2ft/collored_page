import 'package:sherif_raafat/constants/constant_shared_preferences.dart';
import 'package:sherif_raafat/feautres/local_feautre/local_provider.dart';

/// An extension method for `String` that returns the font family
/// to use for the given local language.
extension LocalFontFamily on String? {
  /// Returns the font family to use for the given local language.
  ///
  /// If value is null, the default font family
  /// defined in [SystemData.defaultLocal] is used.
  /// If value is equal to [AppLocal.ar.name], the Arabic font family
  /// defined in [SystemData.arFontFamily]
  /// is used. Otherwise, the English font family
  /// defined in [SystemData.enFontFamily] is used.
  String get familyFont {
    return this == null
        ? SystemData.defaultLocal.name
        : this == AppLocal.ar.name
            ? SystemData.arFontFamily
            : SystemData.enFontFamily;
  }
}
