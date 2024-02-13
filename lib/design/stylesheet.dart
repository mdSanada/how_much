import 'package:flutter/material.dart';

abstract class Stylesheet {
  // Color constants
  static const Color primaryColor = Color(0xFFF34093);
  static const Color secondaryColor = Color(0xFF008B8B);
  static const Color tertiaryColor = Color(0xFFF2D53F);
  static const Color accentColor = Color(0xFF00FF00);

  static const Color black = Color(0xFF212121);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color lightGray = Color(0xFFEEEEEE);

  static const Color error = Color(0xFFD70040);

  // Font constants
  static TextStyle header({Color color = Stylesheet.black}) {
    return TextStyle(
      color: color,
      fontFamily: null,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 28.0,
      height: 1.1,
      letterSpacing: -0.2,
    );
  }

  static TextStyle header02({
    Color color = Stylesheet.black,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color,
      fontFamily: null,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight,
      fontSize: 24.0,
      height: 1.1,
      letterSpacing: -0.2,
    );
  }

  static TextStyle subtitle({
    Color color = Stylesheet.black,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color,
      fontFamily: null,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight,
      fontSize: 20.0,
      height: 1.5,
      letterSpacing: -0.18,
    );
  }

  static TextStyle body({
    Color color = Stylesheet.black,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color,
      fontFamily: null,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeight,
      fontSize: 16.0,
      height: 1.20,
      letterSpacing: 0.08,
    );
  }

  static TextStyle button({Color color = Stylesheet.black}) {
    return TextStyle(
      color: color,
      fontFamily: null,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      height: 1.2,
      letterSpacing: 0.3,
    );
  }

  static TextStyle caption({Color color = Stylesheet.black}) {
    return TextStyle(
      color: color,
      fontFamily: null,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
      height: 1.5,
      letterSpacing: 0.048,
    );
  }
}
