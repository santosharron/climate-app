import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'clima_theme.dart';

final lightTheme = ThemeData.light().copyWith(
  // For some reason, the brightness seems to be wrong if it's not set
  // explicitly.
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Color(0xFF5F6267)),
  colorScheme: ColorScheme.fromSwatch(accentColor: const Color(0xFF1A73E9)),
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF202125),
    actionTextColor: Color(0xFF89B4F8),
    contentTextStyle: TextStyle(color: Color(0xFFE9EAEE)),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(color: Color(0xFF3C4043)),
    titleSmall: TextStyle(color: Color(0xFF5F6267)),
    bodyMedium: TextStyle(color: Color(0xFF3C4043)),
    bodySmall: TextStyle(color: Color(0xFF5F6267)),
    headlineSmall: TextStyle(color: Color(0xFF3C4043)),
  ),
  primaryTextTheme: const TextTheme(
    titleSmall: TextStyle(color: Color(0xFF3C4043)),
    titleMedium: TextStyle(color: Color(0xFF3C4043)),
    titleLarge: TextStyle(color: Color(0xFF3C4043)),
  ),
  bannerTheme: const MaterialBannerThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    contentTextStyle: TextStyle(
      color: Color(0xFF3C4043),
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    titleTextStyle: TextStyle(color: Color(0xFF212121)),
    backgroundColor: Color(0xFFFFFFFF),
    actionsIconTheme: IconThemeData(color: Color(0xFF5F6267)),
    iconTheme: IconThemeData(color: Color(0xFF5F6267)),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      statusBarColor: Color(0xFFFFFFFF),
    ),
  ), checkboxTheme: CheckboxThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xFF1A73E9); }
 return null;
 }),
 ), radioTheme: RadioThemeData(
 fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xFF1A73E9); }
 return null;
 }),
 ), switchTheme: SwitchThemeData(
 thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xFF1A73E9); }
 return null;
 }),
 trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
 if (states.contains(MaterialState.disabled)) { return null; }
 if (states.contains(MaterialState.selected)) { return const Color(0xFF1A73E9); }
 return null;
 }),
 ),
);

const lightClimaTheme = ClimaThemeData(
  loadingIndicatorColor: Colors.black,
  sheetPillColor: Color(0xFFDBDCE0),
);
