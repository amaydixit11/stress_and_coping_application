import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension TextStyleExtensions on TextStyle {
  TextStyle get lato => copyWith(fontFamily: 'Lato');
  TextStyle get roboto => copyWith(fontFamily: 'Roboto');
  TextStyle get mulish => copyWith(fontFamily: 'Mulish');
  TextStyle get leagueSpartan => copyWith(fontFamily: 'League Spartan');
  TextStyle get sFProDisplay => copyWith(fontFamily: 'SF Pro Display');
  TextStyle get plusJakartaSans => copyWith(fontFamily: 'Plus Jakarta Sans');
  TextStyle get sFProText => copyWith(fontFamily: 'SF Pro Text');
  TextStyle get poppins => copyWith(fontFamily: 'Poppins');
  TextStyle get kumbhSans => copyWith(fontFamily: 'Kumbh Sans');
}

class CustomTextStyles {
  // Body text style
  static TextStyle get bodyLargeBlack90001 =>
      theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyLargeLeagueSpartan =>
      theme.textTheme.bodyLarge!.leagueSpartan;

  static TextStyle get bodyMediumBlack90001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyMediumBlack90001_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get bodyMediumBlue700 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blue700,
      );

  static TextStyle get bodyMediumKumbhSansGray10001 =>
      theme.textTheme.bodyMedium!.kumbhSans.copyWith(
        color: appTheme.gray10001,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get bodyMediumLato =>
      theme.textTheme.bodyMedium!.lato.copyWith(
        fontSize: 13.fSize,
      );

  static TextStyle get bodyMediumLatoBlack90001 =>
      theme.textTheme.bodyMedium!.lato.copyWith(
        color: appTheme.black90001,
        fontSize: 13.fSize,
      );

  static TextStyle get bodyMediumLeagueSpartan =>
      theme.textTheme.bodyMedium!.leagueSpartan;

  static TextStyle get bodyMediumMulish => theme.textTheme.bodyMedium!.mulish;

  static TextStyle get bodySmallLatoBlueGray200 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.blueGray200,
        fontSize: 10.fSize,
      );

  static TextStyle get bodySmallLatoDeepPurpleA780 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.deepPurpleA700,
        fontSize: 10.fSize,
      );

  static TextStyle get bodySmallLatoPurple4488 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.purpleA400,
        fontSize: 18.fSize,
      );

  static TextStyle get bodySmallLatoRedA788 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.redA700,
        fontSize: 18.fSize,
      );

  static TextStyle get bodySmallLatoYellow888 =>
      theme.textTheme.bodySmall!.lato.copyWith(
        color: appTheme.yellow800,
        fontSize: 18.fSize,
      );

  static TextStyle get bodySmallPoppinsOnErrorContainer =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
      );

  static TextStyle get bodySmallPoppinsOnErrorContainer8 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        fontSize: 8.fSize,
      );

  static TextStyle get bodySmallSFProTextGray500 =>
      theme.textTheme.bodySmall!.sFProText.copyWith(
        color: appTheme.gray500,
      );

  // Display text style
  static TextStyle get displaySmallCyanA400 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.cyanA400,
      );

  static TextStyle get displaySmallCyan4488_1 =>
      theme.textTheme.displaySmall!.copyWith(
        color: appTheme.cyanA400,
      );

  // Label text style
  static TextStyle get labelLargeSFProTextTeal1500 =>
      theme.textTheme.labelLarge!.sFProText.copyWith(
        color: appTheme.teal500,
        fontWeight: FontWeight.w500,
      );

  // Title text style
  static TextStyle get titleLargeDeepOrange300 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.deepOrange300,
      );

  static TextStyle get titleLargeKumbhSansGray18001 =>
      theme.textTheme.titleLarge!.kumbhSans.copyWith(
        color: appTheme.gray10001,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleLargeSFProDisplayGray300 =>
      theme.textTheme.titleLarge!.sFProDisplay.copyWith(
        color: appTheme.gray300,
      );

  static TextStyle get titleLargeTeal30001 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.teal30001,
      );

  static TextStyle get titleSmallBlack90001 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90001,
      );

  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );

  static TextStyle get titleSmallGray90003 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray90003,
      );

  static TextStyle get titleSmallPlusJakartaSans =>
      theme.textTheme.titleSmall!.plusJakartaSans;

  static TextStyle get titleSmallPoppins =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        fontSize: 15.fSize,
      );

  static TextStyle get titleSmallPoppinsLime700 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.lime700,
        fontSize: 15.fSize,
      );

  static TextStyle get titleSmallPoppinsOnErrorContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );

  static TextStyle get titleSmallPoppinsPurple48001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.purple40001,
        fontSize: 15.fSize,
      );
}
