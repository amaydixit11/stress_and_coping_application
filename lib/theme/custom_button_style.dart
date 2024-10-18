import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor:
            appTheme.gray100, // Corrected placement of backgroundColor
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10.h), // Corrected borderRadius position
        ),
        elevation: 0,
        padding: EdgeInsets.zero,
      );

  // Text button style with no background or border
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(color: Colors.transparent), // Corrected BorderSide
        ),
      );
}
