
import 'package:flutter/material.dart';

class CustomColorTheme {
  /// Polytok Colors
  static const Color primary = Color(0xfff5f8ff);
  static const Color inputFill = Color(0xffE9EFFF);
  static const Color inputHint = Color(0xff8A8686);
  static const Color buttonFill = Color(0xff307AFF);
  static const Color buttonFillRed = Color(0xdbff4c30);
  static const Color snackSuccess = Color(0xff31C653);
  static const Color snackCaution = Color(0xffE2B317);
  static const Color textColor = Color(0xff898580);
  static const Color filterColor = Color(0xffB6BABE);
  static const Color searchBoxColor = Color(0xff303B49);
  static const Color gradientLoginPageStart = Color(0xff0099cc);
  static const Color gradientLoginPageEnd = Color(0xff66ffff);
  static const Color chatIconsColor = Color(0xff007F7F);
  static const Color gredentColor1 = Color(0xff1E9B5B);
  static const Color gredentColor2 = Color(0xff74AA2D);
  static const Color gredentColor3 = Color(0xffF4A351);
  static const Color gredentColor4 = Color(0xff00AFEF);
  static const Color gredentColor5 = Color(0xff27A09E);
  static const Color gredentColor6 = Color(0xff00afef);
  static const Color gredentColor8 = Color(0xFF4F8F6A);
  static const Color gredentColor9 = Color(0xFF1E9B5B );
  static const Color deepOrangeAccent = Colors.deepOrangeAccent;

  /// Car Card Colors
  static const Color background = Color(0xffE5E5E5);
  static const Color commentsBackGroundColor = Color(0xfff2f2f2);
  static const Color backgroundSecondary = Color(0xffF1F3F4);

  static const Color textBlack = Color(0xff000000);
  static const Color textBlackLight = Color(0xff3C3A3A);

  static const Color secondaryMediumGrey = Color(0xff0000004D);
  static const Color primaryBlack = Color(0xff141915);
  static const Color secondaryDarkGrey = Color(0xff606260);
  static const Color primaryDarkGrey = Color(0xff414141);
  static const Color primaryVariant = Color(0xff2A2828);
  static const Color primaryGrey = Color(0xffBABABA);
  static const Color secondaryBlack = Color(0xff2B2F2C);
  static const Color primaryBlue = Color(0xff239DD1);
  static const Color secondaryRed = Color(0xffE2173A);
  static const Color primaryShadowGrey = Color(0xffBABABA);
  static const Color secondary = Color(0xffE2B317);

  ThemeData get themeData {
    ColorScheme colorSchemeCarCard = ColorScheme(
      // The color displayed most frequently across your app’s screens and components.
      primary: primary,
      // The background color for widgets like Card.
      surface: backgroundSecondary,
      // A color that typically appears behind scrollable content
      background: background,
      // An accent color that, when used sparingly, calls attention to parts of your app.
      secondary: secondary,
      // The color to use for input validation errors, e.g. for InputDecoration.errorText.
      error: Color(0xffE2173A),
      // A color that's clearly legible when drawn on primary. [...]
      onPrimary: Color(0xffBABABA),
      // A color that's clearly legible when drawn on secondary. [...]
      onSecondary: Color(0xff239DD1),
      // A color that's clearly legible when drawn on surface. [...]
      onSurface: Color(0xffF1F3F4),
      // A color that's clearly legible when drawn on background. [...]
      onBackground: Color(0xff606260),
      // A color that's clearly legible when drawn on error. [...]
      onError: Color(0xffE2173A),
      // The overall brightness of this color scheme.
      brightness: Brightness.light,
    );

    return ThemeData.from(colorScheme: colorSchemeCarCard);
  }
}
