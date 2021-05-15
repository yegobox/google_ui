import 'package:flutter/material.dart';

const ColorScheme defaultColorScheme = ColorScheme(
  primary: Color(0xFF1A73E9),
  primaryVariant: Color(0xFF1D62D6),
  secondary: Color(0xFF1A73E9),
  secondaryVariant: Color(0xFF1D62D6),
  surface: Colors.white,
  background: Colors.white,
  error: Color(0xFFC6074A),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onSurface: Color(0xFF3C4043),
  onBackground: Color(0xFF3C4043),
  onError: Colors.white,
  brightness: Brightness.light,
);

class GoogleTheme {
  ThemeData apply({ColorScheme? customColorScheme}) {
    final colorScheme = customColorScheme ?? defaultColorScheme;
    return ThemeData(
        fontFamily: "Poppins",
        colorScheme: colorScheme,
        primaryColor: colorScheme.primary,
        accentColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onBackground),
        elevatedButtonTheme: _createElevatedButtonStyle(colorScheme),
        textTheme: _createTextTheme(colorScheme));
  }

  ElevatedButtonThemeData _createElevatedButtonStyle(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => colorScheme.primary,
        ),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => colorScheme.primaryVariant,
        ),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states
              .where((e) =>
                  e == MaterialState.pressed || e == MaterialState.hovered)
              .isNotEmpty) {
            return 3;
          }
          return 0;
        }),
      ),
    );
  }

  TextTheme _createTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      headline1: TextStyle(
        fontSize: 93,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: colorScheme.onBackground,
      ),
      headline2: TextStyle(
        fontSize: 58,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: colorScheme.onBackground,
      ),
      headline3: TextStyle(
        fontSize: 46,
        fontWeight: FontWeight.w400,
        color: colorScheme.onBackground,
      ),
      headline4: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colorScheme.onBackground,
      ),
      headline5: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w400,
        color: colorScheme.onBackground,
      ),
      headline6: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: colorScheme.onBackground,
      ),
      subtitle1: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: colorScheme.onBackground,
      ),
      subtitle2: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: colorScheme.onBackground,
      ),
      bodyText1: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: colorScheme.onBackground,
      ),
      bodyText2: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: colorScheme.onBackground,
      ),
      button: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: colorScheme.onBackground,
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: colorScheme.onBackground,
      ),
      overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: colorScheme.onBackground,
      ),
    );
  }
}
