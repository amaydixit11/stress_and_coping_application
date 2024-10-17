import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Dark decorations
  static BoxDecoration get darkThemeSystemSurface => BoxDecoration(
        color: appTheme.gray90004,
      );

  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray900,
      );

  static BoxDecoration get fillBluegray100 => BoxDecoration(
        color: appTheme.blueGray100,
      );

  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900,
      );

  static BoxDecoration get fillGray90002 => BoxDecoration(
        color: appTheme.gray90002,
      );

  static BoxDecoration get fillGray90005 => BoxDecoration(
        color: appTheme.gray90005,
      );

  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue100,
      );

  static BoxDecoration get fillLightBlue50 => BoxDecoration(
        color: appTheme.lightBlue50,
      );

  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  static BoxDecoration get fillPurple => BoxDecoration(
        color: appTheme.purple900,
      );

  static BoxDecoration get fillTeal => BoxDecoration(
        color: appTheme.tea1900,
      );

  // Neutral decorations
  static BoxDecoration get neutralWhite => BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );

  // Now decorations
  static BoxDecoration get nowInAndroidSysDarkInverseOnSurface => BoxDecoration(
        color: appTheme.gray90087,
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray90004,
        border: Border.all(
          color: appTheme.gray90004,
          width: 1.0, // Adjust according to your design
        ),
      );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL16 => BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      );

  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
        top: Radius.circular(30.0),
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(1.0);

  static BorderRadius get roundedBorder12 => BorderRadius.circular(12.0);

  static BorderRadius get roundedBorder16 => BorderRadius.circular(16.0);

  static BorderRadius get roundedBorder30 => BorderRadius.circular(30.0);

  static BorderRadius get roundedBorder34 => BorderRadius.circular(34.0);

  static BorderRadius get roundedBorder64 => BorderRadius.circular(64.0);

  static BorderRadius get roundedBorder70 => BorderRadius.circular(70.0);

  static BorderRadius get roundedBorder8 => BorderRadius.circular(8.0);
}
