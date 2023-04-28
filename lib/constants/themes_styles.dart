import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sherif_raafat/constants/app_colors.dart';

/// represents a set of Scheme colors
const colorScheme = ColorScheme(
  primary: AppColors.primaryElement,
  onPrimary: AppColors.primaryBackGroundColor,
  onSurface: AppColors.primaryBackGroundColor,
  brightness: Brightness.light,
  error: AppColors.primaryBackGroundColor,
  background: AppColors.primaryBackGroundColor,
  surface: AppColors.primaryBackGroundColor,
  onError: AppColors.primaryBackGroundColor,
  onSecondary: AppColors.primaryBackGroundColor,
  onBackground: AppColors.primaryBackGroundColor,
  secondary: AppColors.primaryBackGroundColor,
  onPrimaryContainer: AppColors.primaryBackGroundColor,
);

/// A `TextTheme` object that defines the text styles used in the app.
const textTheme = TextTheme(
  bodyMedium: TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  ),
);

/// A `TextStyle` object that defines the style for error text in the app.
const errorStyle = TextStyle(
  color: AppColors.primaryText,
  fontSize: 15,
);

/// A `SystemUiOverlayStyle` object that defines the style of the system UI
/// overlay (such as the navigation bar) in the app.
const systemUiOverlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: AppColors.primaryBackGroundColor,
  systemNavigationBarIconBrightness: Brightness.light,
  systemNavigationBarDividerColor: AppColors.primaryBackGroundColor,
);
