// size
import 'package:flutter/cupertino.dart';

/// The size of the spinner widget.
const spinSize = 50.0;

/// The size of the padding used between widgets.
const paddingSize = 20.0;

/// The saturation value used to compute the luminance of a color.
///
/// This value is used to desaturate a color before computing its luminance,
/// in order to  improve the accuracy of the luminance computation.
const saturationValue = 0.5;

/// The luminance value used to determine whether
/// a color is considered light or dark.
///
/// If the luminance of a color is less than or equal to this value,
/// the color is considered dark.
/// Otherwise, it is considered light.
const luminanceLimit = 150;

/// The padding used between widgets in the vertical direction.
///
/// This constant defines an [EdgeInsets] object that applies padding
/// to the top and bottom
/// of a widget, using the value of [paddingSize] as the padding size.
const verticalPaddingEdgeInsets = EdgeInsets.symmetric(vertical: paddingSize);
