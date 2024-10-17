import 'package:flutter/material.dart';
import '../core/app_export.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;

    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.primary,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray800,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 16.0,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 14.0,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.gray600,
          fontSize: 12.0,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 40.0,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 36.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 30.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 12.0,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 20.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: appTheme.redA70001,
          fontSize: 16.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onErrorContainer.withOpacity(1),
          fontSize: 14.0,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w600,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF003257),
    primaryContainer: Color(0XFF739BE0),
    errorContainer: Color(0XFF444359),
    onErrorContainer: Color(0XCEFFFFFF),
    onPrimary: Color(0XFFFEE6C6),
    onPrimaryContainer: Color(0XFF171718),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);
  // Black
  Color get black900 => Color(0XFF00160A);
  Color get black90001 => Color(0XFF000000);
  // Blue
  Color get blue200 => Color(0XFF97B8FF);
  Color get blue400 => Color(0XFF4B92E5);
  Color get blue700 => Color(0XFF1668E3);
  Color get blueA400 => Color(0XFF1877F2);
  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray200 => Color(0XFFADB5BD);
  Color get blueGray20001 => Color(0XFFBAC0CB);
  Color get blueGray600 => Color(0XFF33798C);
  Color get blueGray60001 => Color(0XFF5C6092);
  Color get blueGray700 => Color(0XFF4E5567);
  Color get blueGray800 => Color(0XFF3F414E);
  Color get blueGray80001 => Color(0XFF3F4553);
  Color get blueGray900 => Color(0XFF31262D);
  // Cyan
  Color get cyan900 => Color(0XFF0B3E62);
  Color get cyanA400 => Color(0XFF0CD2FD);
  // DeepOrange
  Color get deepOrange100 => Color(0XFFE7CCA8);
  Color get deepOrange10001 => Color(0XFFE5CAA6);
  Color get deepOrange200 => Color(0XFFFDBCA0);
  Color get deepOrange300 => Color(0XFFFF8456);
  Color get deepOrange50 => Color(0XFFF2EDE4);
  // DeepPurple
  Color get deepPurpleA700 => Color(0XFF1602FC);
  // Gray
  Color get gray100 => Color(0XFFF3F2F2);
  Color get gray10001 => Color(0XFFF6F6F6);
  Color get gray10002 => Color(0XFFF2F2F2);
  Color get gray300 => Color(0XFFDADADD);
  Color get gray50 => Color(0XFFF7F7FC);
  Color get gray500 => Color(0XFF9D9DA5);
  Color get gray600 => Color(0XFF6F6F6F);
  Color get gray700 => Color(0XFF696969);
  Color get gray800 => Color(0XFF43434E);
  Color get gray900 => Color(0XFF231737);
  Color get gray90001 => Color(0XFF211920);
  Color get gray90002 => Color(0XFF2E212C);
  Color get gray90003 => Color(0XFF0F1828);
  Color get gray90004 => Color(0XFF1F1F25);
  Color get gray90005 => Color(0XFF241737);
  Color get gray90087 => Color(0X87201A1B);
  // Green
  Color get green300 => Color(0XFF808996);
  Color get green400 => Color(0XFF66A986);
  // Indigo
  Color get indigo200 => Color(0XFF90B0DF);
  Color get indigo500 => Color(0XFF3672BB);
  Color get indigo800 => Color(0XFF374482);
  Color get indigoA100 => Color(0XFF8C96FF);
  Color get indigoA10001 => Color(0XFF8E97FD);
  Color get indigoA700 => Color(0XFF002DE3);
  // LightBlue
  Color get lightBlue100 => Color(0XFFB4F1FF);
  Color get lightBlue50 => Color(0XFFDAF2FF);
  // LightGreen
  Color get lightGreen300 => Color(0XFFAFDA94);
  // Lime
  Color get lime700 => Color(0XFFCDB224);
  // Orange
  Color get orange100 => Color(0XFFF8D7AB);
  // Purple
  Color get purple200 => Color(0XFFC89EF1);
  Color get purple300 => Color(0XFFDA62C4);
  Color get purple30001 => Color(0XFFB176E2);
  Color get purple400 => Color(0XFFB1489E);
  Color get purple40001 => Color(0XFFC354AF);
  Color get purple900 => Color(0XFF490E62);
  Color get purpleA400 => Color(0XFFEF12B8);
  // Red
  Color get red300 => Color(0XFFDF8370);
  Color get redA700 => Color(0XFFFC0202);
  Color get redA70001 => Color(0XFFFD0C0C);
  // Teal
  Color get teal300 => Color(0XFF4C9AAF);
  Color get tea130001 => Color(0XFF4A97AC);
  Color get teal500 => Color(0XFF039C86);
  Color get tea1900 => Color(0XFF013259);
  // White
  Color get whiteA700 => Color(0XFFFFFFFE);
  // Yellow
  Color get yellow800 => Color(0XFFFFB61D);
}
