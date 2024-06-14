import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/font_family.dart';
import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      brightness: Brightness.dark,
      applyElevationOverlayColor: true,
      primaryColorLight: colorBlueLight,
      primaryColor: colorBlue,
      primaryColorDark: colorBlueDark,
      scaffoldBackgroundColor: colorWhite,
      colorScheme: ColorScheme(
          primary: colorBlue,
          onPrimary: colorGreyLighter,
          secondary: colorPurple,
          onSecondary: colorGreyLighter,
          surface: colorSlateDark,
          onSurface: colorGreyLighter,
          tertiary: colorRed,
          onTertiary: colorGreyLighter,
          error: colorRedDark,
          onError: colorGreyLighter,
          brightness: Brightness.dark),
      dialogBackgroundColor: colorSlateDark,
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: FontFamily.poetsenOne,
            displayColor: colorBlack,
            bodyColor: colorBlack,
            decorationColor: colorBlack,
          ),
      dialogTheme: DialogTheme(
        backgroundColor: colorGreyLighter,
        elevation: 100,
        shadowColor: colorBlue,
        surfaceTintColor: colorBlue,
        iconColor: colorBlack,
      ),
      iconTheme: IconThemeData(color: colorBlack),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: colorWhite, selectedItemColor: colorBlue),
      appBarTheme: AppBarTheme(backgroundColor: colorWhite, iconTheme: IconThemeData(color: colorBlack)),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      applyElevationOverlayColor: true,
      primaryColorLight: colorBlueLight,
      primaryColor: colorBlue,
      primaryColorDark: colorBlueDark,
      scaffoldBackgroundColor: colorSlateDark,
      colorScheme: ColorScheme(
          primary: colorBlue,
          onPrimary: colorGreyLighter,
          secondary: colorPurple,
          onSecondary: colorGreyLighter,
          surface: colorSlateDark,
          onSurface: colorGreyLighter,
          tertiary: colorRed,
          onTertiary: colorGreyLighter,
          error: colorRedDark,
          onError: colorGreyLighter,
          brightness: Brightness.dark),
      dialogBackgroundColor: colorSlateDark,
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: FontFamily.poetsenOne,
            displayColor: colorGreyLighter,
            bodyColor: colorGreyLighter,
            decorationColor: colorGreyLighter,
          ),
      dialogTheme: DialogTheme(
        backgroundColor: colorSlateDark,
        elevation: 100,
        shadowColor: colorBlue,
        surfaceTintColor: colorBlue,
        iconColor: colorGreyLighter,
      ),
      iconTheme: IconThemeData(color: colorGreyLighter),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: colorSlateDark, selectedItemColor: colorBlue),
      appBarTheme: AppBarTheme(backgroundColor: colorSlateDark, iconTheme: IconThemeData(color: colorGreyLighter)),
    );
  }
}
