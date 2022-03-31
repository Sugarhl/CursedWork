import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static TextStyle heading1({
    double fontSize = 36.0,
    FontWeight fontWeight = FontWeight.w700,
    double height = 43.57 / 36.0,
    Color color = const Color(0xff2B2D33),
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle heading2({
    double fontSize = 24.0,
    FontWeight fontWeight = FontWeight.w700,
    double height = 29.05 / 24.0,
    Color color = AppColors.light,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle button1({
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.w700,
    double height = 18.0 / 18.0,
    Color color = AppColors.light,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle bigText({
    double fontSize = 18.0,
    FontWeight fontWeight = FontWeight.w400,
    double height = 18.0 / 18.0,
    Color color = const Color(0xff2B2D33),
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle button2({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w500,
    double height = 19.36 / 16.0,
    Color color = AppColors.light,
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle mainText({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
    double height = 16.94 / 14.0,
    Color color = const Color(0xff2B2D33),
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle smallText({
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w500,
    double height = 14.52 / 12.0,
    Color color = const Color(0xff2B2D33),
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle input({
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w400,
    double height = 14.52 / 12.0,
    Color color = const Color(0xff2B2D33),
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );

  static TextStyle inter({
    double fontSize = 10.0,
    FontWeight fontWeight = FontWeight.w400,
    double height = 12.1 / 10,
    Color color = const Color(0xff2B2D33),
  }) =>
      GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        color: color,
      );
}

abstract class AppColors {
  static const Color light = Color(0xffF4E5E4);
  static const Color white = Color(0xffFFFFFF);
  static const Color red = Color(0xff845858);
  static const Color dark = Color(0xff534141);
  static const Color hintText = Color(0x445C4343);
  static const Color black = Color(0xff2B2D33);
  static const Color orange = Color(0xffEB916B);
// static const Color cardShadow = Color(0x40003482);
}
